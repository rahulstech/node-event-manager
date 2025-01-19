const  { errorcodes, EventDB, EventDBError } = require('../../database/eventsdb')

const joi = require('joi')

const loggers = require('../../utils/loggers')

const { pushValidBody, pushValidParams } = require('../../utils/helpers')
const { InputValidationError } = require('../input_validation/inputvalidator')

const logger = loggers.logger.child({ module: 'EventDataServie' })

const eventsdb = EventDB.create()



const schemaEventId = joi.number().integer()

async function validateEventIdParameter(eventId) {

    logger.info('will validate eventId require parameter')
    logger.debug(`eventId = ${eventId}`)

    try {
        const validEventId = await schemaEventId.validateAsync(eventId)

        logger.info('eventId successfully validated')

        return validEventId
    }
    catch(err) {
        throw new InputValidationError(err)
    }
}

const mwGetEventById = async (req, res, next) => {

    let eventId = undefined

    if ( req.validParams && ('eventId' in req.validParams)) {
        eventId = req.validParams.eventId

        logger.verbose(`eventId ${eventId} found in req.validParams`)
    }
    else if (req.params && ('eventId' in req.params)) {

        logger.verbose(`eventId ${req.params.eventId} found in req.params`)
        
        try {
            eventId = await validateEventIdParameter(req.params.eventId)
    
            pushValidParams(req, { eventId })
        }
        catch(err) {
    
            logger.error(`mwGetEventById() encountered an error while validating eventId; `, err)
    
            if (err instanceof InputValidationError) {
                return res.status(404).json({ code: 404, message: 'unknown endpoint' })
            }
            else {
                return res.status(500).json({ code: 500, message: 'internal server error' })
            }
        }
    }
    else {
        // TODO: can i reach this situation?
    }

    logger.info(`will get event for id ${eventId} typeof '${typeof eventId}'`, )

    try {
        const event = eventsdb.getEventById(eventId)

        logger.info(`get event by id ${eventId} successful`)
        logger.debug('event ', { debugExtras: event })

        pushValidBody(req, { event })

        next()
    }
    catch(err) {

        logger.error(`mwGetEventById(eventId=${eventId}) encountered an error while quering database; `, err)

        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}` })
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error' })
        }
    }
}

const mwCreateEvent = async (req, res, next) => {
    const { eventData } = req.validBody

    try {
        const newEvent = await eventsdb.createEvent(eventData)

        pushValidBody(req, { newEvent })

        next()
    }
    catch(err) {
        logger.error('mwCreateEvent() encountered an error; ', err)

        return res.status(500).json({ code: 500, message: 'internal server error' })
    }
}

const mwUpdateEvent = async (req, res, next) => {

    const { eventId } = req.validParams 

    const { event, eventData } = req.validBody

    logger.info('will update event in database')
    logger.debug('eventId, event, eventData ', { debugExtras: { eventId, event, eventData }})

    try {
        const data = { ...event, ...eventData }

        const updatedEvent = await eventsdb.updateEvent(eventId, data)

        logger.info('event updated in database successfully')
        logger.debug('new event ', { debugExtras: updatedEvent })

        pushValidBody(req, { updatedEvent })

        next()
    }
    catch(err) {
        logger.error('mwUpdateEvent() encountered an error', err)

        return res.status(500).json({ code: 500, message: 'internal server error' })
    }
}

const mwGetAllEvents = (req, res, next) => {

    logger.info('will fetch all events from database')

    try {
        const events = eventsdb.getAllEvents()

        logger.info('all events fetched from database successfully')
        logger.debug('events ', { debugExtras: events})

        pushValidBody(req, { events })

        next()
    }
    catch(err) {
        logger.error('mwGetAllEvents() encountered an error; ', err)

        return res.status(500).json({ code: 500, message: 'internal server error' })
    }
}

const mwFilterEvents = (req, res, next) => {

    logger.info('will fetch matched events from database')
    logger.debug('query ', { debugExtras: req.query })

    const { k, status, venu, organizer } = req.query

    try {
        const events = eventsdb.filterEvents(k, status, venu, organizer)
        
        logger.info('all matched events fetched successfully')
        logger.debug('matched events ', { debugExtras: events })

        pushValidBody(req, { events })

        next()
    }
    catch(err) {
        logger.error('mwFilterEvents() encountered an error; ', err)

        return res.status(500).json({ code: 500, message: 'inter server error'})
    }
}

module.exports = {
    mwGetEventById, mwCreateEvent, mwUpdateEvent, mwGetAllEvents, mwFilterEvents
}
