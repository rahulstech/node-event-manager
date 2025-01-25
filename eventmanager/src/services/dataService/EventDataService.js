const  { EventStatus, Event } = require('../../database/eventsdb')
const { Op } = require('sequelize')
const loggers = require('../../utils/loggers')
const { AppError } = require('../../utils/errors')
const { renameKeys, formatDateTime } = require('../../utils/helpers')


const logger = loggers.logger.child({ module: 'EventDataServie' })

function toServiceValues( data ) {
    return renameKeys([
        ['start', 'eventStart'], ['end', 'eventEnd']
    ], data, {
        valueConverter: ( key, value ) => {
            if (key === 'eventStart' || key === 'eventEnd') {
                return formatDateTime(value)
            }
            return value
        }
    })
}

function toResponseEvent( data ) {
    return renameKeys([
        ['eventStart','start'], ['eventEnd', 'end']
    ], data)
}

const addEvent = async ( eventData ) => {

    const values = toServiceValues(eventData)

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
    
    // TODO: complete filter events
    
    const eventModels = await Event.findAll({
        raw: true,
        where: {
            title: { [Op.like]: '%k%' }
        }
    })

    const events = eventModels.map( eventModel => toResponseEvent(eventModel.toJSON()))

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

    const values = toServiceValues(eventData)

    await event.update(values)

    return toResponseEvent(event.toJSON())
}

module.exports = {
    addEvent, getAllEvents, getEventById, filterEvents, setEvent
}
