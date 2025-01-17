const joi = require('joi')
const utils = require('../../utils/helpers')
const loggers = require('../../utils/loggers')
const { EventStatus } = require('../../database/eventsdb')
const { InputValidationError, getJoiCustomDateTimeRule } = require('./inputvalidator')

const logger = loggers.logger.child({ module: 'EventInputValidationService'})

const field_title = joi.string()

const field_organizer = joi.string()

const field_venu = joi.string()

const field_description = joi.string()

const field_start = joi.string().custom(getJoiCustomDateTimeRule())

const field_end = joi.string().custom(getJoiCustomDateTimeRule())

const field_status = joi.string().valid(...EventStatus.values())

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

const validateCreateEventBody = async ( body ) => {

    logger.info('will validate create event body')
    logger.debug('body received for create event', { debugExtras: body })

    try {
        const value = await schemaCreateEvent.validateAsync( body, { abortEarly: false })

        logger.info('create event body validated successfully')
        logger.debug('valid value for create event ', { debugExtras: value })

        return value
    }
    catch (err) {
        throw new InputValidationError(err)
    }
}

const mwCreateEventBodyValidator = async (req, res, next) => {
    const body = req.body

    if (body === null || body === undefined) {
        return res.status(400).json({ code: 400, message: 'empty body' })
    }

    if (Object.keys(body).length === 0) {
        return res.status(400).json({ code: 400, message: 'empty body' })
    }

    try {
        const value = await validateCreateEventBody(req.body)

        req.validBody = value

        next()
    }
    catch (err) {
        logger.error('mwCreateEventBodyValidator() encountered an error; ', err)

        if (err instanceof InputValidationError) {
            res.status(400).json({ code: 400, message: err.message })
        }
        else {
            res.status(500).json({ code: 500, message: 'internal server error' })
        }
    }
}

////////////////////////////////////////
///      Validate Update Event      ///
///////////////////////////////////////

const schemaUpdateEvent = joi.object({

    title: field_title,
    
    organizer: field_organizer,

    venu: field_venu,

    description: field_description,

    start: field_start,

    end: field_end,

    status: field_status
})

const validateUpdateEventBody = async ( body ) => {
    logger.info('will validate update event body')
    logger.debug('body received for update event ', { debugExtras: body })

    try {
        const value = await schemaUpdateEvent.validateAsync(body)

        logger.info('update event body validated succesdfully')
        logger.debug('valid valid for update event ', { debugExtras: value })

        return value
    }
    catch(err) {
        throw new InputValidationError(err)
    }
}

const mwUpdateEventBodyValidator = async (req, res, next) => {
    const body = req.body

    if (body === null || body === undefined) {
        return res.status(400).json({ code: 400, message: 'empty body' })
    }

    if (Object.keys(body).length === 0) {
        return res.status(400).json({ code: 400, message: 'empty body' })
    }

    try {
        const value = await validateUpdateEventBody(req.body)

        req.validBody = value

        next()
    }
    catch (err) {
        logger.error('mwUpdateEventBodyValidator() encountered an error; ', err)

        if (err instanceof InputValidationError) {
            res.status(400).json({ code: 400, message: err.message })
        }
        else {
            res.status(500).json({ code: 500, message: 'internal server error' })
        }
    }
}

module.exports = {
    validateCreateEventBody,validateUpdateEventBody,
    mwCreateEventBodyValidator, mwUpdateEventBodyValidator,
}