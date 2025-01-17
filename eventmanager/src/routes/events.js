const { errorcodes, EventDB, EventDBError } = require('../database/eventsdb')
const multer = require('multer')
const utils = require('../utils/helpers')
const loggers = require('../utils/loggers')
const { mwCreateEventBodyValidator, mwUpdateEventBodyValidator } = require('../services/input_validation/EventInputValidationService')

const logger = loggers.logger.child({ module: 'EventRoutes' })

const eventdb = EventDB.create()

// Read

const getAllEvents = (req, res) => {

    logger.info('called getAllEvents()')
    
    const events = eventdb.getAllEvents()

    logger.info('successfully fetched all events')
    logger.debug('all events = ', { debugExtras: events })

    res.status(200).json({
        code: 200,
        message: "successful",
        data: events
    })
}

const getEventById = (req, res) => {
    const { eventId } = req.params

    logger.info(`called: getEventById() and eventId = ${eventId}`)

    const _id = Number(eventId)
    try {
        const event = eventdb.getEventById(_id)

        if (null == event) {
            logger.debug(`event with id ${eventId} = `, { debugExtras: event })

            res.status(404).json({
                code: 404,
                message: `no event found with id ${eventId}`
            })
        }
        else {
            logger.debug(`no event with id ${eventId}`)

            res.status(200).json({
                code: 200,
                message: "successful",
                data: event
            })
        }
    }
    catch(err) {
        logger.error(err)
        if (err instanceof EventDBError && err.code == errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}`})
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error'})
        }
    }
}

const filterEvents = (req, res) => {

    logger.info('called filterEvents()')
    console.debug('filterEvent query ', { debugExtras: req.query })

    const { k, status, venu, organizer } = req.query

    try {
        const events = eventdb.filterEvents(k, status, venu, organizer)

        logger.debug('filtered events = ', { debugExtras: events })

        res.status(200).json({ code: 200, message: 'successful', data: events})
    }
    catch(err) {
        logger.error(err)
        return res.status(500).json({ code: 500, message: 'inter server error'})
    }
}

// create

const getCreateEventMiddleWares = () => {
    return [
        multer().none(), // extract body
        mwCreateEventBodyValidator, // validate body
    ]
}

const createEvent = async (req, res) => {

    // step1: invalidate inputs: all the title, organizer, venu, description, start, end must be set.
    //        check start and end is a valid date time string in format yyyy-MM-dd HH:mm
    //        if status not set then set default status to "PENDING"

    logger.info('called createEvent()')

    // step2: add the event to database
    try {
        
        const event = req.validBody

        const newEvent = await eventdb.createEvent(event)

        logger.info('new event saved successfully')
        logger.debug('new event ', { debugExtras: newEvent })

        // step3: send the response
        return res.status(200).json({ code: 200, message: "event saved", data: newEvent })
    }
    catch(err) {
        logger.error('createEvent() encountered an error; ',err)
        return res.status(500).json({ code: 500, message: "not saved"})
    }
}

// update

const getUpdateEventMiddleWares = () => {
    return [
        multer().none(), // extract body

        mwUpdateEventBodyValidator // validate body
    ]
}

const updateEvent = async (req, res) => {
    const { eventId } = req.params

    logger.info(`called updateEvent() and eventId = ${eventId}`)
    logger.debug(`updateEvent() body = `, { debugExtras: req.body })

    const { title, organizer, venu, description, start, end, status } = req.body

    const _id = Number(eventId)

    let startDatetime = null
    let endDatetime = null
    if (start) {
        try {
            startDatetime = utils.parseDateTime(start)
        }
        catch(err) {
            logger.error(err)
            return res.status(400).json({ code: 400, message: `invalid end datetime '${start}'`})
        }
    }
    if (end) {
        try {
            endDatetime = utils.parseDateTime(end)
        }
        catch(err) {
            logger.error(err)
            return res.status(4000).json({ code: 400, message: `invalid end datetime '${end}'`})
        }
    }

    try {
        const input = { title, organizer, venu, description, 
            start: startDatetime, end: endDatetime, status }

        const event = await eventdb.updateEvent(_id, input)

        logger.info(`event with id ${eventId} updated successfully`)
        logger.debug(`updated event = `, { debugExtras: event })
            
        res.status(200).json({ code: 200, message: 'event updated', data: event })
    }
    catch(err) {
        logger.error(err)
        if (err instanceof EventDBError && err.code == errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}` })
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server srror' })
        }
    }
}

module.exports = {
    getAllEvents, getEventById, filterEvents, 
    getCreateEventMiddleWares, createEvent, 
    getUpdateEventMiddleWares, updateEvent
}