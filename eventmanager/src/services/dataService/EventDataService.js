const  { errorcodes, EventDB, EventDBError, EventStatus } = require('../../database/eventsdb')

const loggers = require('../../utils/loggers')

const { AppError } = require('../../utils/errors')

const { isDateTimeAfter } = require('../../utils/helpers')

const logger = loggers.logger.child({ module: 'EventDataServie' })

const eventsdb = EventDB.create()

function checkEndIsAfterStartExclusive(start, end) {
    if (!isDateTimeAfter(end, start)) {
        throw new AppError('end must be after start', 400)
    }
}

const addEvent = async ( eventData ) => {

    const { start, end } = eventData

    checkEndIsAfterStartExclusive(start, end)

    try {
        const newEvent = await eventsdb.createEvent(eventData)

        return newEvent
    }
    catch(err) {
        throw AppError(err.message)
    }
}

const getAllEvents = async () => {

    try {
        const events = await eventsdb.getAllEvents()

        return events
    }
    catch(err) {
        throw new AppError(err.message)
    }
}

const getEventById = async ( eventId ) => {

    try {
        const event = await eventsdb.getEventById(eventId)

        return event
    }
    catch(err) {
        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            throw new AppError(err.message, 404)
        }

        throw new AppError(err.message)
    }
}

const filterEvents = async ({ k, status, venu, organizer }) => {
    try {
        const events = await eventsdb.filterEvents(k, status, venu, organizer)

        return events
    }
    catch(err) {
        throw new AppError(err.message)
    }
}

const setEvent = async ( eventId, eventData ) => {

    /**
     * 1. get event by id
     * 2. if found then check event start, end and status for consistency
     * 3. if not found throw 404 not found error
     * 4. save the udpated event
     */

    const { start: newStart, end: newEnd } = eventData

    try {
        const event = await eventsdb.getEventById(eventId)

        const { status, start, end } = event

        // if event status is CANCELED or FINISED can not update

        if (status === EventStatus.CANCELED || status === EventStatus.FINISHED) {
            throw new AppError(`can not update event with status ${status}`, 422)
        }

        // ensure end > start

        if (newStart && newEnd) {
            checkEndIsAfterStartExclusive(newEnd, newStart)
        }
        else if (!newStart && newEnd) {
            checkEndIsAfterStartExclusive(start, newEnd)
        }
        else if (newStart && !newEnd) {
            checkEndIsAfterStartExclusive(end, newStart)
        }

        // all data consistent, save in database

        const data = { ...event, ...eventData } 

        const updatedEvent = await eventsdb.updateEvent(eventId, data)

        return updatedEvent
    }
    catch(err) {
        if (err instanceof AppError) {
            throw err
        }

        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            throw new AppError(`no event found with id ${eventId}`, 404)
        }

        throw new AppError(err.message)
    }
}

module.exports = {
    addEvent,
    
    getAllEvents, getEventById, filterEvents,

    setEvent
}
