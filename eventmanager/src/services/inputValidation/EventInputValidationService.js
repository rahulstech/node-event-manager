const joi = require('joi')

const { pushValidBody, isDateTimeAfter, pushValidParams, pushValidQuery } = require('../../utils/helpers')

const loggers = require('../../utils/loggers')

const { EventStatus } = require('../../database/eventsdb')

const { getJoiCustomDateTimeRule, validate } = require('./inputvalidator')


const { AppError } = require('../../utils/errors')

const logger = loggers.logger.child({ module: 'EventInputValidationService'})

const field_title = joi.string()

const field_organizer = joi.string()

const field_venu = joi.string()

const field_description = joi.string()

const field_start = joi.custom(getJoiCustomDateTimeRule())

const field_end = joi.custom(getJoiCustomDateTimeRule())

const field_status = joi.string().valid(...EventStatus.values())

const field_eventId = joi.number().integer().required()

////////////////////////////////////////
///      Validate Update Event      ///
///////////////////////////////////////

const schemaCreateEvent = joi.object({

    title:  field_title.required(),
    
    organizer:  field_organizer.required(),

    venu:  field_venu.required(),

    description:  field_description.required(),

    start: field_start.required(),

    end: field_end.required(),

    status: field_status.default(EventStatus.PENDING)
})

const mwCreateEventBodyValidator = async (req, res, next) => {

    const { body } = req

    logger.info('will validate create event body')
    logger.debug('body received for create event', { debugExtras: body })

    if (body === null || body === undefined) {
        throw new AppError('empty body', 400)
    }

    const eventData = await validate( schemaCreateEvent, body)

    logger.info('event validated for create event successfully')
    logger.debug('valid event data', { debugExtras: eventData })

    pushValidBody(req, { eventData })

    next()
}

////////////////////////////////////////
///      Validate Update Event      ///
///////////////////////////////////////

const schemaUpdateEvent = joi.object({

    params: joi.object({
        eventId: field_eventId.required()
    }),

    body: joi.object({
        title: field_title,
    
        organizer: field_organizer,
    
        venu: field_venu,
    
        description: field_description,
    
        start: field_start,
    
        end: field_end,
    
        status: field_status
    }),    
})

const mwUpdateEventBodyValidator = async (req, res, next) => {
    const body = req.body

    if (body === null || body === undefined) {
        throw new AppError('empty body', 400)
    }

    const value = { params: req.params, body: req.body }

    const { params: { eventId }, body: eventData } = await validate(schemaUpdateEvent, value)

    pushValidParams(req, { eventId })
    pushValidBody(req, { eventData })

    next()
}

////////////////////////////////////////
///      Validate Get Event          ///
///////////////////////////////////////

/** Get Event By Id */

const schemaGetEventById = joi.object({
    eventId: field_eventId
})

const mwGetEventByIdValidator = async (req, res, next) => {

    const { params } = req

    const { eventId } = await validate(schemaGetEventById, params)

    pushValidParams(req, { eventId })

    next()
}

/** Filter Event */

const schemaFilterEvents = joi.object({
    k: joi.string(),

    status: field_status,

    organizer: field_organizer,

    venu: field_venu
})

const mwFilterEventsValidator = async (req, res, next) => {

    const { query } = req

    const value = await validate(schemaFilterEvents,  query)

    const { k, status, organizer, venu } = value

    pushValidQuery(req, { k, status, organizer, venu })

    next()
}

module.exports = {
    mwCreateEventBodyValidator,
    
    mwGetEventByIdValidator, mwFilterEventsValidator,

    mwUpdateEventBodyValidator,
}