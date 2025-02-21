const { sequelize, Event, EventStatus } = require('../../../src/database/eventsdb')
const { addEvent, setEvent, getEventById, getAllEvents, filterEvents } = require('../../../src/services/dataService/EventDataService')


const event1 = {
    id: 1,
    title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
    eventStart: new Date(2023, 4, 15, 14, 30), eventEnd: new Date(2023, 4, 15, 16, 0), status: "CANCELED"
}

const event2 = {
    id: 2,
    title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
    eventStart: new Date(2023, 3, 17, 7, 30), eventEnd: new Date(2023, 3, 17, 9, 30), status: "PENDING"
}

const event3 = {
    id: 3,
    title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
    eventStart: new Date(2023, 3, 30, 12, 0), eventEnd: new Date(2023, 3, 30, 15, 0), status: "RUNNING"
}

const event4 = {
    id: 4,
    title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
    eventStart: new Date(2023, 7, 15, 14, 0), eventEnd: new Date(2023, 7, 15, 16, 0), status: "FINISHED"
}

const event5 = {
    id: 5,
    title: "quater planning meeting", organizer: "Organizer C", venu: "Venu C", description: "this is quater planning meeting of organizer C",
    eventStart: new Date(2023, 7, 15, 14, 0), eventEnd: new Date(2023, 7, 15, 16, 0), status: "PENDING"
}

const events = [ event1, event2, event3, event4, event5 ]

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
            eventStart: new Date(2023, 8, 15, 12, 0), eventEnd: new Date(2023, 8, 15, 14, 0), status: "PENDING"
        }
    
        const expected = { id: 6, title: "new event", organizer: "organizer", venu: "venu", description: "event description",
            start: new Date(2023, 8, 15, 12, 0), end: new Date(2023, 8, 15, 14, 0), status: EventStatus.PENDING
        }
    
        return expect(addEvent(eventData)).resolves.toEqual(expect.objectContaining(expected))
    })

    test('eventStart is after eventEnd', () => {
    
        const eventData = {
            title: "new event", organizer: "organizer ", venu: "venu", description: "event description",
            start: new Date(2023, 8, 15, 14, 0), end: new Date(2023, 8, 15, 12, 0), status: "PENDING"
        }
    
        return expect(addEvent(eventData)).rejects.toThrow()
    })
})

test('getAllEvents', () => {

    const expected = [
         {
            id: 1,
            title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
            start: new Date(2023, 4, 15, 14, 30), end: new Date(2023, 4, 15, 16, 0), status: "CANCELED"
        },
        {
            id: 2,
            title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
            start: new Date(2023, 3, 17, 7, 30), end: new Date(2023, 3, 17, 9, 30), status: "PENDING"
        },
        {
            id: 3,
            title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
            start: new Date(2023, 3, 30, 12, 0), end: new Date(2023, 3, 30, 15, 0), status: "RUNNING"
        },
        {
            id: 4,
            title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
            start: new Date(2023, 7, 15, 14, 0), end: new Date(2023, 7, 15, 16, 0), status: "FINISHED"
        },
        {
            id: 5,
            title: "quater planning meeting", organizer: "Organizer C", venu: "Venu C", description: "this is quater planning meeting of organizer C",
            start: new Date(2023, 7, 15, 14, 0), end: new Date(2023, 7, 15, 16, 0), status: "PENDING"
        }
    ]

    return expect(getAllEvents()).resolves.toEqual(expected)
})

describe('getEventById', () => {

    test('id 1', () => {
        const expected = {
            id: 1,
            title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
            start: new Date(2023, 4, 15, 14, 30), end: new Date(2023, 4, 15, 16, 0), status: EventStatus.CANCELED
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

describe('filterEvents', () => {

    test('containing keyword "my"', () => {
        const expected = [
            {
                id: 1,
                title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
                start: new Date(2023, 4, 15, 14, 30), end: new Date(2023, 4, 15, 16, 0), status: "CANCELED"
            },
            {
                id: 4,
                title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
                start: new Date(2023, 7, 15, 14, 0), end: new Date(2023, 7, 15, 16, 0), status: "FINISHED"
            }
        ]

        return expect(filterEvents({ k: 'my' })).resolves.toEqual(expected)
    })

    test('having status "PENDING"', () => {
        const expected = [
            {
                id: 2,
                title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
                start: new Date(2023, 3, 17, 7, 30), end: new Date(2023, 3, 17, 9, 30), status: "PENDING"
            },
            {
                id: 5,
                title: "quater planning meeting", organizer: "Organizer C", venu: "Venu C", description: "this is quater planning meeting of organizer C",
                start: new Date(2023, 7, 15, 14, 0), end: new Date(2023, 7, 15, 16, 0), status: "PENDING"
            }
        ]

        return expect(filterEvents({ status: 'PENDING' })).resolves.toEqual(expected)
    })

    test('organized by "me"', () => {
        const expected = [
            {
                id: 1,
                title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
                start: new Date(2023, 4, 15, 14, 30), end: new Date(2023, 4, 15, 16, 0), status: "CANCELED"
            },
            {
                id: 4,
                title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
                start: new Date(2023, 7, 15, 14, 0), end: new Date(2023, 7, 15, 16, 0), status: "FINISHED"
            }
        ]

        return expect(filterEvents({ organizer: 'me' })).resolves.toEqual(expected)
    })

    test('venu at "Salar"', () => {
        const expected = [
            {
                id: 3,
                title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
                start: new Date(2023, 3, 30, 12, 0), end: new Date(2023, 3, 30, 15, 0), status: "RUNNING"
            }
        ]

        return expect(filterEvents({ venu: 'Salar' })).resolves.toEqual(expected)
    })

    test('venu at "Kandi" and status "PENDING"', () => {
        const expected = [
            {
                id: 2,
                title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
                start: new Date(2023, 3, 17, 7, 30), end: new Date(2023, 3, 17, 9, 30), status: "PENDING"
            }
        ]

        return expect(filterEvents({ status: 'PENDING', venu: 'Kandi' })).resolves.toEqual(expected)
    })
})

describe('setEvent', () => { 

    test('event 2', () => {
        const values = {
            title: "annual general event updated", organizer: "organizer A updated", venu: "Kandi updated",
             description: "this is annual event of organizer A updated",
            eventStart: new Date(2023, 3, 17, 7, 0), eventEnd: new Date(2023, 3, 17, 9, 0), status: "PENDING"
        }
    
        const expected = {
                id: 2, title: "annual general event updated", organizer: "organizer A updated", venu: "Kandi updated",
                description: "this is annual event of organizer A updated",
                start: new Date(2023, 3, 17, 7, 0), end: new Date(2023, 3, 17, 9, 0), status: EventStatus.PENDING
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
