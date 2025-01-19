const multer = require('multer')

const loggers = require('../utils/loggers')

const { mwCreateEventBodyValidator, mwUpdateEventBodyValidator } = require('../services/input_validation/EventInputValidationService')

const { mwGetEventById, mwCreateEvent, mwUpdateEvent, mwGetAllEvents, mwFilterEvents } = require('../services/data_service/EventDataService')

const logger = loggers.logger.child({ module: 'EventRoutes' })

// Read

const getGetAllEventsMiddleWares = () => {
    return [
        mwGetAllEvents
    ]
}

const getAllEvents = (req, res) => {

    logger.info('called getAllEvents()')
    
    const { events } = req.validBody

    logger.info('got all events')
    logger.debug('all events ', { debugExtras: events })

    res.status(200).json({
        code: 200,
        message: "successful",
        data: events
    })
}

const getGetEventByIdMiddleWares = () => {
    return [
        mwGetEventById
    ]
}

const getEventById = (req, res) => {

    logger.info('called getEventById()')
    
    const { eventId } = req.validParams
    const { event } = req.validBody

    logger.info(`event forund for id ${eventId}`)
    logger.debug('event ', { debugExtras: event })

    res.status(200).json({ code: 200, message: 'successful', data: event })
}

const getFilterEventsMiddleWares = () => {
    return [
        mwFilterEvents
    ]
}

const filterEvents = (req, res) => {

    logger.info('called filterEvents()')

    const { events } = req.validBody

    logger.info('events filtered successfully')
    logger.info('filtered events ', { debugExtras: events })

    res.status(200).json({ code: 200, message: 'successful', data: events})
}

// create

const getCreateEventMiddleWares = () => {
    return [
        multer().none(), // extract body
        
        mwCreateEventBodyValidator, // validate body

        mwCreateEvent // add in database
    ]
}

const createEvent = (req, res) => {

    logger.info('called createEvent()')

    const { newEvent } = req.validBody 

    logger.info('event validated and created successfully')
    logger.debug('saved event ', { debugExtras: newEvent})

    res.status(200).json({ code: 200, message: "event saved", data: newEvent })
}

// update

const getUpdateEventMiddleWares = () => {
    return [
        multer().none(), // extract body

        mwGetEventById,

        mwUpdateEventBodyValidator, // validate body

        mwUpdateEvent // update in database
    ]
}

const updateEvent = async (req, res) => {
    
    logger.info('called updateEvent()')

    const { updatedEvent } = req.validBody

    logger.info('event validated and updated successfully')
    logger.debug('updated event', { debugExtras: updatedEvent})

    res.status(200).json({ code: 200, message: 'event updated', data: updatedEvent })
}

module.exports = {
    getGetAllEventsMiddleWares, getAllEvents, 

    getGetEventByIdMiddleWares, getEventById, 

    getFilterEventsMiddleWares, filterEvents, 

    getCreateEventMiddleWares, createEvent, 

    getUpdateEventMiddleWares, updateEvent
}