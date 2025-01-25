const loggers = require('../../utils/loggers')
const eventDataService = require('../../services/dataService/EventDataService')


const logger = loggers.logger.child({ module: 'EventApiController' })

const createEvent = async (req, res) => {

    const { eventData } = req.validBody 

    const newEvent = await eventDataService.addEvent(eventData)

    res.status(200).json({ code: 200, message: "event saved", data: newEvent })
}

// Read

const getAllEvents = async (req, res) => {

    const events = await eventDataService.getAllEvents()

    res.status(200).json({
        code: 200,
        message: "successful",
        data: events
    })
}

const getEventById = async (req, res) => {

    const { eventId } = req.validParams

    const event = await eventDataService.getEventById(eventId)

    res.status(200).json({ code: 200, message: 'successful', data: event })
}

const filterEvents = async (req, res) => {
    const events = await eventDataService.filterEvents(req.validQuery)

    res.status(200).json({ code: 200, message: 'successful', data: events })
}

// update

const updateEvent = async (req, res) => {
    
    logger.info('called updateEvent()')

    const { eventId } = req.validParams

    const { eventData } = req.validBody

    const { updatedEvent } = await eventDataService.setEvent(eventId, eventData)

    res.status(200).json({ code: 200, message: 'event updated', data: updatedEvent })
}

module.exports = {
    createEvent, getAllEvents, filterEvents, getEventById, updateEvent,
}