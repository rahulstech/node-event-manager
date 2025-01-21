const  { errorcodes, EventDB, EventDBError, EventStatus } = require('../../database/eventsdb')

const loggers = require('../../utils/loggers')

const { AppError } = require('../../utils/errors')

const { isDateTimeAfter } = require('../../utils/helpers')

const logger = loggers.logger.child({ module: 'EventDataServie' })

const eventsdb = EventDB.create()

function checkEndIsAfterStartExclusive(start, end) {
    if (!isDateTimeAfter(end, start)) {
        throw new AppError('"end" must be after "start"', 400)
    }
}

const addEvent = async ( eventData ) => {

    const { start, end } = eventData

    checkEndIsAfterStartExclusive(start, end)

    const newEvent = await eventsdb.createEvent(eventData)

    return newEvent
}

const getAllEvents = async () => {
    const events = await eventsdb.getAllEvents()
    return events

}

const getEventById = async ( eventId ) => {
    const event = await eventsdb.getEventById(eventId)
    return event
}

const filterEvents = async ({ k, status, venu, organizer }) => {
    const events = await eventsdb.filterEvents(k, status, venu, organizer)
    return events
}

const setEvent = async ( eventId, eventData ) => {

    /**
     * 1. get event by id
     * 2. if found then check event start, end and status for consistency
     * 3. if not found throw 404 not found error
     * 4. save the udpated event
     */

    const { start: newStart, end: newEnd } = eventData

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

    return { oldEvent: event, updatedEvent }
}

module.exports = {
    addEvent, getAllEvents, getEventById, filterEvents, setEvent
}
