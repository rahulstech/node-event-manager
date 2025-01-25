const { EventDB, EventDBError } = require('../../src/database/eventsdb')

const event1 = {
    id: 1,
    title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
    eventStart: new Date(2023,4,15,14,30), eventEnd: new Date(2023,4,15,16,0), status: "CANCELED"
}

const event2 = {
    id: 2,
    title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
    eventStart: new Date(2023,3,17,7,30), eventEnd: new Date(2023,3,17,9,30), status: "PENDING"
}

const event3 = {
    id: 3,
    title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
    eventStart: new Date(2023,3,31,12,0), eventEnd: new Date(2023,3,31,15,0), status: "PENDING"
}

const event4 = {
    id: 4,
    title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
    eventStart: new Date(2023,7,15,14,0), eventEnd: new Date(2023,7,15,16,0), status: "FINISHED"
}

const guest1 = {
    id: 1, eventId: 4,
    firstname: "guest1", lastname: "guest1", age: 25, sex: "FEMALE", guestImage: "guest1.jpg",
    guestEnter: null, guestExit: null, isPresent: 'ABSENT'
}

const guest2 = {
    id: 2, eventId: 2,
    firstname: "guest2", lastname: "guest2", age: 34, sex: "MALE", guestImage: "guest2.jpg",
    guestEnter: null, guestExit: null, isPresent: 'NOTSET'
}

const guest3 = {
    id: 3, eventId: 2,
    firstname: "guest3", lastname: "guest3", age: 27, sex: "MALE", guestImage: "guest3.jpg",
    guestEnter: null, guestExit: null, isPresent: 'NOTSET'
}

const guest4 = {
    id: 4, eventId: 4,
    firstname: "guest4", lastname: "guest4", age: 34, sex: "FEMALE", guestImage: "guest4.jpg",
    guestEnter: new Date(2023,7,15,13,45), guestExit: new Date(2023,74,15,16,15), isPresent: 'PRESENT'
}

const allEvents = [ event1, event2, event3, event4 ]
const allGuests = [ guest1, guest2, guest3, guest4 ]

let instance = null

beforeEach(async () => {
    instance = await EventDB.createTest({ 
        events: allEvents,
        guests: allGuests,
    })
})

afterEach(async () => {
    await EventDB.close()
    instance = null
})


describe('test event CRUD operations', () => {

    test('create new event', () => {
        const event = {
            title: "new event", organizer: "organizer ", venu: "venu", description: "event description",
            eventStart: new Date(2023,8,1,12,0), eventEnd: new Date(2023,8,15,14,0), status: "PENDING"
        }

        const expected = { id: 5, ...event }

        return expect(instance.createEvent(event)).resolves.toEqual(expect.objectContaining(expected))
    })

    // test('get all events', () => {
    //     const events = instance.getAllEvents()
    //     expect(events).toEqual(allEvents)
    // })

    test('get event by id 1', () => {

        return expect(instance.getEventById(1)).resolves.toEqual(expect.objectContaining(event1))
    })

    test('get event by non-existing id', () => {

        return expect(instance.getEventById(10)).resolves.toEqual(null)
    })

    // test('filter events by status', () => {
    //     const events = instance.filterEvents(null,'PENDING')
    //     expect(events).toEqual([ event2, event3 ])
    // })

    test('update event 1', () => {
        const values = {
            title: "my first event updated", organizer: "me updated", venu: "Berhampore updated",
            description: "this is organized by me updated",
            eventStart: new Date(2023,4,15,14,0), eventEnd: new Date(2023,4,15,15,30), status: "PENDING"
        }

        const expected = { id: 1, ...values }

        return expect(instance.updateEvent(1, values)).resolves.toEqual(expect.objectContaining(expected))
    })

    // test('update event 10', () => {
    //     return expect(instance.updateEvent(10, {})).rejects.toThrow(EventDBError)
    // })
})

describe('test guest CRUD operations', () => {

    test(`create new guest for event 2`, () => {
        const guest = {
            firstname: "guest5", lastname: "guest5", age: 27, sex: "FEMALE", guestImage: "guest5.jpg",
            guestEnter: null, guestExit: null, isPresent: 'NOTSET'
        }

        const expected = { id: 5, eventId: 2, ...guest }

        return expect(instance.addGuestForEvent(2, guest)).resolves.toEqual(expect.objectContaining(expected))
    })

    // test('get all guests for event 2', () => {
    //     const expected = [ guest2, guest3]
    //     const actual = instance.getAllGuestsForEvent(2)
    //     expect(actual).toEqual(expected)
    // })

    // test('get all guests for event 1', () => {
    //     const expected = []
    //     const actual = instance.getAllGuestsForEvent(1)
    //     expect(actual).toEqual(expected)
    // })

    test('filter guest for event 4 by keyword \"4\" ', () => {
        const expected = [ guest4 ]
        const actual = instance.filterGuestsForEvent(4, '4')
        expect(actual).toEqual(expected)
    })

    test('filter guest for event 1 by keyword \"4\" ', () => {
        const expected = []
        const actual = instance.filterGuestsForEvent(1, '4')
        expect(actual).toEqual(expected)
    })

    test('get guest 1', () => {
        const expected = guest1
        
        return expect(instance.getGuestById(1)).resolves.toEqual(expect.objectContaining(expected))
    })

    test('get guest 10', () => {

        return expect(instance.getGuestById(10)).resolves.toEqual(null)
    })

    test('update guest 1', () => {
        const guestValues = {
            firstname: "guest1 updated", lastname: "guest1 updated", age: 26, sex: "FEMALE", guest_image_path: "guest1_updated.jpg",
            enter: new Date(2026,5,16,16,0), exit: new Date(2026,5,16,16,0), is_present: 'PRESENT'
        }

        const expected = { id: 1, eventId: 1, ...guestValues }

        return expect(instance.updateGuest(1, guestValues )).resolves.toEqual(expect.objectContaining(expected))
    })

    test('remove guest 1', () => {

        return expect(instance.removeGuest(1)).resolves.toBeTruthy()
    })

    test('remove guest 10', () => {

        return expect(instance.removeGuest(10)).resolves.toBeFalsy()
    })
})