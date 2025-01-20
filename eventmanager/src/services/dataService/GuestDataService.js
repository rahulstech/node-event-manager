const { errorcodes, EventDB, EventDBError, EventStatus, GuestStatus } = require('../../database/eventsdb')

const loggers = require('../../utils/loggers')

const { isDateTimeAfter, isDateTimeBetween } = require('../../utils/helpers')

const { AppError } = require('../../utils/errors')

const { getEventById } = require('./EventDataService')


const logger = loggers.logger.child({ module: 'GuestDataService' })

const eventdb = EventDB.create()

const ensureConsistentGuestData = ( event, guestData ) => {

    const { start, end, status } = event

    const { enter, exit } =  guestData

    // if event is canceled or finished, update not allowed

    if (status === EventStatus.CANCELED || status === EventStatus.FINISHED) {
        logger.warn(`can not update guest for event with status ${EventStatus.CANCELED} or ${EventStatus.FINISHED}`)
        logger.debug(`event status ${status}`)

        throw new AppError(`event status ${status}; can not modify guest`, 422)
    }

    // check enter and exit is between event start and end

    let messages = []
    let inconsistent = false

    if (enter && !isDateTimeBetween(enter, start, end, true)) {
        const message = '"enter" must be between event start and end'

        messages.push(message)

        inconsistent = true
    }

    if (exit && !isDateTimeBetween(exit, start, end, true)) {
        const message = '"exit" must be between event start and end'

        messages.push(message)

        inconsistent = true
    }

    if (inconsistent) {
        logger.warn('inconsistent guest update data found', { debugExtras: messages })

        throw new AppError(JSON.stringify(messages), 422)
    }
}

function checkEnterExistWithIsPresent( value ) {
    const { enter, exit, is_present } = value

    if (is_present && is_present === GuestStatus.PRESENT) {
        if (enter && exit) {
            if (!isDateTimeAfter(exit, enter, true)) {
                throw new AppError('exit must be after enter', 422)
            }
        }
        else {
            throw new AppError('enter and exit is required when "is_present" is PRESENT', 422)
        }
    }
}

const addGuest = async ( eventId, guestData ) => {

    checkEnterExistWithIsPresent(guestData)

    try {

        const event = await eventdb.getEventById(eventId)

        ensureConsistentGuestData(event, guestData)

        const newGuest = await eventdb.addGuestForEvent(eventId, guestData)

        return newGuest
    }
    catch(err) {
        if (err instanceof AppError) {
            throw err
        }
        
        throw new AppError(err.message)
    }
}

const getAllGuestsForEvent = async ( eventId ) => {
    try {
        const guests = eventdb.getAllGuestsForEvent(eventId)

        return guests
    }
    catch(err) {
        throw new AppError(err.message)
    }
}

const searchGuestForEvent = async ( eventId, { k }) => {
    try {
        const guests = eventdb.filterGuestsForEvent(eventId, k)
        
        return guests
    }
    catch(err) {
        throw new AppError(err.message)
    }
}

const getGuestById = async ( guestId ) => {
    try {
        const event = eventdb.getGuestById(guestId)

        return event
    }
    catch(err) {
        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            throw new AppError(err.message, 404)
        }

        throw new AppError(err.message)
    }
}

const setGuest = async ( guestId, guestData ) => {

    checkEnterExistWithIsPresent(guestData)

    try {
        const guest = await eventdb.getGuestById(guestId)

        const event = await getEventById(guest.eventId)

        ensureConsistentGuestData(event, guestData)

        const updatedGuest = await eventdb.updateGuest(guestId, guestData)

        return { oldGuest: guest, updatedGuest }
    }
    catch(err) {
        if (err instanceof AppError) {
            throw err
        }

        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            throw new AppError(err.message, 404)
        }

        throw new AppError(err.message)
    }
}

const removeGuest = async ( guestId ) => {

    try {
        await eventdb.removeGuest(guestId)
    }
    catch(err) {
        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            throw new AppError(err.message, 404)
        }

        throw new AppError(err.message)
    }
}


module.exports = {
    ensureConsistentGuestData,

    addGuest, getAllGuestsForEvent, searchGuestForEvent, getGuestById,setGuest,removeGuest,
}