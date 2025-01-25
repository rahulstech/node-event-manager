const { Op } = require('sequelize')
const { Guest, Event, EventStatus, GuestStatus } = require('../../database/eventsdb')
const loggers = require('../../utils/loggers')
const { isDateTimeBetween, renameKeys, formatDateTime, parseDateTime } = require('../../utils/helpers')
const { AppError } = require('../../utils/errors')


const logger = loggers.logger.child({ module: 'GuestDataService' })

function ensureEventStatus( { status } ) {

    // if event is canceled or finished, update not allowed
    if (status === EventStatus.CANCELED || status === EventStatus.FINISHED) {
        throw new AppError(`event status ${status}; can not modify guest list`, 422)
    }
}

function ensureConsistentGuestData( event, guestData ) {

    const { eventStart, eventEnd } = event

    const { enter, exit } =  guestData

    ensureEventStatus(event)

    // check enter and exit is between event start and end

    const start = parseDateTime(eventStart)
    const end = parseDateTime(eventEnd)

    const messages = []
    let inconsistent = false

    if (enter && !isDateTimeBetween(enter, start, end, true)) {
        const message = '"enter" must be between event "start" and "end"'

        messages.push(message)

        inconsistent = true
    }

    if (exit && !isDateTimeBetween(exit, start, end, true)) {
        const message = '"exit" must be between event "start" and "end"'

        messages.push(message)

        inconsistent = true
    }

    if (inconsistent) {
        const message = messages.join('\n')

        throw new AppError(message, 422)
    }
}

function toServiceValues(guestData) {
    return renameKeys([
        ['guest_image', 'guestImage'],
        ['enter', 'guestEnter'], ['exit', 'guestExit'], ['is_present', 'isPresent']
    ],
    guestData, 
    {
        valueConverter: ( key, value ) => {
            if (key === 'guestEnter' || key === 'guestExit') {
                if (!value) {
                    return null
                }
                return formatDateTime(value)
            }
            return value
        }
    })
}

function toResponseGuest(guestModel) {
    return renameKeys([
        ['guestImage', 'guest_image'],
        ['guestEnter', 'enter',], ['guestExit', 'exit'], ['isPresent', 'is_present']
    ],
    guestModel,
    {
        defaultValueProvider: (key) => {
            if (key === 'enter' || key === 'exit') {
                return null
            }
            return undefined
        }
    })
}

function removeEnterExitIfNotPresent(values) {
    if (!values.isPresent || values.isPresent !== GuestStatus.PRESENT) {
        if (values.guestEnter) {
            values.guestEnter = null
        }
        if (values.guestExit) {
            values.guestExit = null
        }
    }
}

async function findEventByIdOrThrow( eventId ) {
    const event = await Event.findOne({ where: { id: eventId }})

    if ( null === event ) {
        throw new AppError(`no event found with id ${eventId}`, 404)
    }

    return event
}

///////////////////////////////////////
///     Guest Service Methods      ///
/////////////////////////////////////

const addGuest = async ( eventId, guestData ) => {

    const event = await findEventByIdOrThrow(eventId)

    ensureConsistentGuestData(event, guestData)

    const values = toServiceValues(guestData)

    removeEnterExitIfNotPresent(values)

    const newGuest = await event.createGuest(values)

    return toResponseGuest(newGuest.toJSON())
}

const getAllGuestsForEvent = async ( eventId ) => {
    
    const event = await findEventByIdOrThrow(eventId)

    const rawGuests = await event.getGuests({ 
        raw: true,
    })

    const guests = rawGuests.map( guest => toResponseGuest(guest))

    return guests
}

const searchGuestForEvent = async ( eventId, { k }) => {

    const event = await findEventByIdOrThrow(eventId)
    
    const rawGuests = await event.getGuests({
        raw: true,
        where: {
            [Op.or]: [
                { firstname: { [Op.like]: `%${k}%` }},
                { lastname: { [Op.like]: `%${k}%` }}
            ],
        }
    })

    const guests = rawGuests.map( guest => toResponseGuest(guest))

    return guests
}

const getGuestById = async ( guestId ) => {
    const guestModel = await Guest.findOne({ where: { id: guestId }})

    if ( null === guestModel) {
        throw new AppError(`no guest found with id ${guestId}`, 404)
    }

    return toResponseGuest(guestModel.toJSON())
}

const setGuest = async ( guestId, guestData ) => {

    const guest = await Guest.findOne({
        where: { id: guestId }
    })

    if (null === guest) {
        throw new AppError(`no guest found with id ${guestId}`, 404)
    }

    const event = await guest.getEvent({ 
        attributes: ['status', 'eventStart', 'eventEnd']
    })

    ensureConsistentGuestData(event, guestData)

    const oldGuest = { ...guest.toJSON() }

    const values = toServiceValues(guestData)

    removeEnterExitIfNotPresent(values)

    await guest.update(values)

    return { oldGuest: toResponseGuest(oldGuest), updatedGuest: toResponseGuest(guest.toJSON()) }
}

const removeGuest = async ( guestId ) => {

    const guest = await Guest.findOne({ 
        where: { id: guestId }
    })

    if (guest === null) {
        throw new AppError(`no guest found with id ${guestId}`, 404)
    }

    const event = await guest.getEvent()

    ensureEventStatus(event)

    await guest.destroy()

    return toResponseGuest(guest.toJSON())
}

module.exports = {
    ensureConsistentGuestData,
    addGuest, getAllGuestsForEvent, searchGuestForEvent, getGuestById,setGuest,removeGuest,
}