const { EventDB, EventDBError } = require('../../src/database/eventsdb')

const event1 = {
    id: 1,
    title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
    start: new Date(2023,4,15,14,30), end: new Date(2023,4,15,16,0), status: "CANCELED"
}

const event2 = {
    id: 2,
    title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
    start: new Date(2023,3,17,7,30), end: new Date(2023,3,17,9,30), status: "PENDING"
}

const event3 = {
    id: 3,
    title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
    start: new Date(2023,3,31,12,0), end: new Date(2023,3,31,15,0), status: "PENDING"
}

const event4 = {
    id: 4,
    title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
    start: new Date(2023,7,15,14,0), end: new Date(2023,7,15,16,0), status: "FINISHED"
}

const guest1 = {
    id: 1, eventId: 4,
    firstname: "guest1", lastname: "guest1", age: 25, sex: "FEMALE", guest_image_path: "guest1.jpg",
    enter: null, exit: null, is_present: 'ABSENT'
}

const guest2 = {
    id: 2, eventId: 2,
    firstname: "guest2", lastname: "guest2", age: 34, sex: "MALE", guest_image_path: "guest2.jpg",
    enter: null, exit: null, is_present: 'NOTSET'
}

const guest3 = {
    id: 3, eventId: 2,
    firstname: "guest3", lastname: "guest3", age: 27, sex: "MALE", guest_image_path: "guest3.jpg",
    enter: null, exit: null, is_present: 'NOTSET'
}

const guest4 = {
    id: 4, eventId: 4,
    firstname: "guest4", lastname: "guest4", age: 34, sex: "FEMALE", guest_image_path: "guest4.jpg",
    enter: new Date(2023,7,15,13,45), exit: new Date(2023,74,15,16,15), is_present: 'PRESENT'
}

const allEvents = [ event1, event2, event3, event4 ]
const allGuests = [ guest1, guest2, guest3, guest4 ]

let instance = null

beforeEach(() => {
    instance = EventDB.createTest({ 
        events: allEvents,
        eventCounter: 4,
        guests: allGuests,
        guestCounter: 4
    })
})

afterEach(() => {
    EventDB.instance = null
})



describe('test event CRUD operations', () => {

    test('create new event', () => {
        const event = {
            title: "new event", organizer: "organizer ", venu: "venu", description: "event description",
            start: new Date(2023,8,1,12,0), end: new Date(2023,8,15,14,0), status: "PENDING"
        }

        const expected = { id: 5, ...event }

        return expect(instance.createEvent(event)).resolves.toEqual(expected)
    })

    test('get all events', () => {
        const events = instance.getAllEvents()
        expect(events).toEqual(allEvents)
    })

    test('get event by id 1', () => {
        const event = instance.getEventById(1)
        expect(event).toEqual(event1)
    })

    test('get event by non-existing id', () => {
        const runGet = () => {
            instance.getEventById(10)
        }
        expect(runGet).toThrow(EventDBError)
    })

    test('filter events by status', () => {
        const events = instance.filterEvents(null,'PENDING')
        expect(events).toEqual([ event2, event3 ])
    })

    test('update event 1', () => {
        const input = {
            title: "my first event updated", organizer: "me updated", venu: "Berhampore updated",
            description: "this is organized by me updated",
            start: new Date(2023,4,15,14,0), end: new Date(2023,4,15,15,30), status: "PENDING"
        }
        const expected = { id: 1, ...input }
        return expect(instance.updateEvent(1, input)).resolves.toEqual(expected)
    })

    test('update event 10', () => {
        return expect(instance.updateEvent(10, {})).rejects.toThrow(EventDBError)
    })
})

describe('test guest CRUD operations', () => {

    test(`create new guest for event 2`, () => {
        const guest = {
            eventId: 2,
            firstname: "guest5", lastname: "guest5", age: 27, sex: "FEMALE", guest_image_path: "guest5.jpg",
            enter: null, exit: null, is_present: 'NOTSET'
        }
        const expected = { id: 5, ...guest }
        return expect(instance.addGuestForEvent(2, guest)).resolves.toEqual(expected)
    })

    test('get all guests for event 2', () => {
        const expected = [ guest2, guest3]
        const actual = instance.getAllGuestsForEvent(2)
        expect(actual).toEqual(expected)
    })

    test('get all guests for event 1', () => {
        const expected = []
        const actual = instance.getAllGuestsForEvent(1)
        expect(actual).toEqual(expected)
    })

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
        const actual = instance.getGuestById(1)
        expect(actual).toEqual(expected)
    })

    test('get guest 10', () => {
        expect(() => instance.getGuestById(10)).toThrow(EventDBError)
    })

    test('update guest 1', () => {
        const guestData = {
            id: 1, eventId: 4,
            firstname: "guest1 updated", lastname: "guest1 updated", age: 26, sex: "FEMALE", guest_image_path: "guest1_updated.jpg",
            enter: new Date(2026,5,16,16,0), exit: new Date(2026,5,16,16,0), is_present: 'PRESENT'
        }

        const expected = { ...guestData }

        return expect(instance.updateGuest(1, guestData )).resolves.toEqual(expected)
    })

    test('remove guest 1', () => {
        return expect(instance.removeGuest(1)).resolves.not.toThrow()
    })
})