const  { EventStatus, Event, captureDBErrorAsync } = require('../../database/eventsdb')
const { Op } = require('sequelize')
const loggers = require('../../utils/loggers')
const { AppError } = require('../../utils/errors')
const { renameKeys, formatDateTime } = require('../../utils/helpers')


const logger = loggers.logger.child({ module: 'EventDataServie' })

//////////////////////////////////////////////
///          Utility Methods              ///
////////////////////////////////////////////

function toEventValues( data ) {
    return renameKeys([
        ['start', 'eventStart'], ['end', 'eventEnd']
    ], data)
}

function toResponseEvent( data ) {
    return renameKeys([
        ['eventStart','start'], ['eventEnd', 'end']
    ],
     data, {
        valueConverter: (key, value) => {
            if (key === 'start' || key === 'end') {
                if (value.constructor.name === 'String') {
                    return new Date(value)
                }
            }
            return value
        }
     })
}

//////////////////////////////////////////////
///             CRUD Methods              ///
////////////////////////////////////////////

const addEvent = async ( eventData ) => {

    const values = toEventValues(eventData)

    const newEvent = await Event.create(values)

    return toResponseEvent(newEvent.toJSON())
}

const getAllEvents = async () => {
    const rawEvents = await Event.findAll({
        raw: true,
    })

    const events = rawEvents.map( event => toResponseEvent(event))

    return events
}

const getEventById = async ( eventId ) => {

    const rawEvent = await Event.findOne({ 
        raw: true,
        where: { id: eventId }})

    if (null === rawEvent) {
        throw new AppError(`no event found with id ${eventId}`, 404)
    }

    return toResponseEvent(rawEvent)
}

const filterEvents = async ({ k, status, venu, organizer }) => {
    
    const filters = []

    if (k) {
        filters.push({ title: { [Op.like]: `%${k}%`}})
    }
    if (venu) {
        filters.push({ venu: { [Op.like]: `%${venu}%`}})
    }
    if (organizer) {
        filters.push({ organizer: { [Op.like]: `%${organizer}%`}})
    }
    if (status) {
        filters.push({ status })
    }
    
    const rawEvents = await Event.findAll({
        raw: true,
        exclude: ['eventStart', 'eventEnd'],
        where: {
            [Op.and]: filters
        }
    })

    const events = rawEvents.map( event => toResponseEvent(event))

    return events
}

const setEvent = async ( eventId, eventData ) => {

    const event = await Event.findOne({ 
        where: { id: eventId }
    })

    // if event does not exists throw error 404 not found 

    if (null === event) {
        throw new AppError(`no event found with id ${eventId}`, 404)
    }

    // if event status is CANCELED or FINISED, can not update

    const { status } = event

    if (status === EventStatus.CANCELED || status === EventStatus.FINISHED) {
        throw new AppError(`can not update event with status ${status}`, 422)
    }

    // keep a copy of old event to send it later

    const values = toEventValues(eventData)

    await event.update(values)

    return toResponseEvent(event.toJSON())
}

module.exports = {
    captureDBErrorAsync,
    addEvent, getAllEvents, getEventById, filterEvents, setEvent
}
