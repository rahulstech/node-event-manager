const { EventStatus } = require('../../../src/database/Event')
const { sequelize, Event } = require('../../../src/database/eventsdb')
const { addEvent, setEvent, getEventById, getAllEvents } = require('../../../src/services/dataService/EventDataService')


const event1 = {
    id: 1,
    title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
    eventStart: "2023-05-15 14:30" , eventEnd: "2023-05-15 16:00", status: "CANCELED"
}

const event2 = {
    id: 2,
    title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
    eventStart: "2023-04-17 07:30", eventEnd: "2023-04-17 09:30", status: "PENDING"
}

const event3 = {
    id: 3,
    title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
    eventStart: "2023-04-30 12:00", eventEnd: "2023-04-30 15:00", status: "RUNNING"
}

const event4 = {
    id: 4,
    title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
    eventStart: "2023-08-15 14:00", eventEnd: "2023-08-15 16:00", status: "FINISHED"
}

const events = [ event1, event2, event3, event4 ]

beforeEach(async () => {

    await sequelize.authenticate()

    await sequelize.sync({ force: true })

    for (const values of events) {
        await Event.create(values)
    }
})

describe('addEvent', () => {

    test('valid eventData', () => {
    
        const eventData = {
            title: "new event", organizer: "organizer", venu: "venu", description: "event description",
            eventStart: "2023-09-15 12:00", eventEnd: "2023-09-15 14:00", status: "PENDING"
        }
    
        const expected = { id: 5, title: "new event", organizer: "organizer", venu: "venu", description: "event description",
            start: "2023-09-15 12:00", end: "2023-09-15 14:00", status: EventStatus.PENDING
        }
    
        return expect(addEvent(eventData)).resolves.toEqual(expect.objectContaining(expected))
    })

    test('eventStart is after eventEnd', () => {
    
        const eventData = {
            title: "new event", organizer: "organizer ", venu: "venu", description: "event description",
            start: new Date(2023,8,15,14,0), end: new Date(2023,8,15,12,0), status: "PENDING"
        }
    
        return expect(addEvent(eventData)).rejects.toThrow()
    })
})

test('getAllEvents', () => {

    const expected = [
         {
            id: 1,
            title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
            start: "2023-05-15 14:30" , end: "2023-05-15 16:00", status: "CANCELED"
        },
        {
            id: 2,
            title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
            start: "2023-04-17 07:30", end: "2023-04-17 09:30", status: "PENDING"
        },
        {
            id: 3,
            title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
            start: "2023-04-30 12:00", end: "2023-04-30 15:00", status: "RUNNING"
        },
        {
            id: 4,
            title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
            start: "2023-08-15 14:00", end: "2023-08-15 16:00", status: "FINISHED"
        }
    ]

    return expect(getAllEvents()).resolves.toEqual(expected)
})

describe('getEventById', () => {

    test('id 1', () => {
        const expected = {
            id: 1,
            title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
            start: "2023-05-15 14:30", end: "2023-05-15 16:00", status: EventStatus.CANCELED
        }
        return expect(getEventById(1)).resolves.toEqual(expected)
    })
    
    test('id 50', () => {
    
        return expect(getEventById(50)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            message: 'no event found with id 50'
        }))
    })
})

describe('setEvent', () => { 

    test('event 2', () => {
        const values = {
            title: "annual general event updated", organizer: "organizer A updated", venu: "Kandi updated",
             description: "this is annual event of organizer A updated",
            eventStart: "2023-04-17 07:00", eventEnd: "2023-04-17 09:00", status: "PENDING"
        }
    
        const expected = {
                id: 2, title: "annual general event updated", organizer: "organizer A updated", venu: "Kandi updated",
                description: "this is annual event of organizer A updated",
                start: "2023-04-17 07:00", end: "2023-04-17 09:00", status: EventStatus.PENDING
        }
    
        return expect(setEvent(2, values)).resolves.toEqual(expected)
    })
    
    test('event 50', () => {
        const values = {
            title: "updated title"
        }
    
        return expect(setEvent(50, values)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            message: 'no event found with id 50',
            statusCode: 404
        }))
    })
    
    test('event with status CANCELED', () => {
        const values = {
            title: 'updated title'
        }
    
        return expect(setEvent(1, values)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            message: 'can not update event with status CANCELED',
            statusCode: 422
        }))
    })
 })

