const { sequelize, Event, EventStatus, Guest, GuestStatus, Sex } = require('../../../src/database/eventsdb')
const { ensureConsistentGuestData,
        addGuest, getGuestById, getAllGuestsForEvent, 
        searchGuestForEvent, setGuest, removeGuest } = require("../../../src/services/dataService/GuestDataService")
const { AppError } = require('../../../src/utils/errors')

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
    guestEnter: new Date(2023, 7, 15, 13, 45), guestExit: new Date(2023, 7, 15, 16, 15), isPresent: 'PRESENT'
}

const events = [ event1, event2, event3, event4]
const guests = [ guest1, guest2, guest3, guest4]

beforeEach(async () => {
    await sequelize.authenticate()

    await sequelize.sync({ force: true })

    for( const event of events ) {
        await Event.create(event)
    }

    for( const guest of guests) {
        await Guest.create(guest)
    }
})

describe('ensureConsistentGuestData', () => {

    test('valid data', () => {
        const event = {
            eventStart: new Date(2024, 5, 4, 7, 15),
    
            eventEnd: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {
            enter: new Date(2024, 5, 4, 7, 30),
    
            exit: new Date(2024, 5, 4, 8, 20),
        }
    
        expect(() => ensureConsistentGuestData(event, guestData)).not.toThrow()
    })

    test('no enter and exit', () => {
        const event = {
            eventStart: new Date(2024, 5, 4, 7, 15),
    
            eventEnd: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {}
    
        expect(() => ensureConsistentGuestData(event, guestData)).not.toThrow()
    })

    test('enter not between event start and end', () => {
        const event = {
            eventStart: new Date(2024, 5, 4, 7, 15),
    
            eventEnd: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {
            enter: new Date(2024, 5, 4, 7, 0),
    
            exit: new Date(2024, 5, 4, 8, 20),
        }
    
        expect(() => ensureConsistentGuestData(event, guestData))
        .toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 422,
            message: '"enter" must be between event "start" and "end"'
        }))
    })

    test('exit not between event start and end', () => {
        const event = {
            eventStart: new Date(2024, 5, 4, 7, 15),
    
            eventEnd: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {
            enter: new Date(2024, 5, 4, 7, 30),
    
            exit: new Date(2024, 5, 4, 9, 0),
        }
    
        expect(() => ensureConsistentGuestData(event, guestData))
        .toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 422,
            message: '"exit" must be between event "start" and "end"'
        }))
    })

    test('enter and exit not between event start and end', () => {
        const event = {
            eventStart: new Date(2024, 5, 4, 7, 15),
    
            eventEnd: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {
            enter: new Date(2024, 5, 4, 7, 0),
    
            exit: new Date(2024, 5, 4, 9, 0),
        }
    
        expect(() => ensureConsistentGuestData(event, guestData))
        .toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 422,
            message: '"enter" must be between event "start" and "end"\n"exit" must be between event "start" and "end"'
        }))
    })

    test('event status CANCELED', () => {
        const event = {
            status: EventStatus.CANCELED
        }
    
        const guestData = {}
    
        expect(() => ensureConsistentGuestData(event, guestData)).toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 422,
            message: 'event status CANCELED; can not modify guest list'
        }))
    })

    test('event status FINISHED', () => {
        const event = {
            status: EventStatus.FINISHED
        }
    
        const guestData = {}
    
        expect(() => ensureConsistentGuestData(event, guestData)).toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 422,
            message: 'event status FINISHED; can not modify guest list'
        }))
    })
})

describe('addGuest', () => {

    test('for event 2', () => {

        const guestData = {
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: null, exit: null, is_present: 'NOTSET'
        }

        const expected = {
            id: 5, eventId: 2,
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: null, exit: null, is_present: GuestStatus.NOTSET
        }

        return expect(addGuest(2, guestData)).resolves.toEqual(expected)
    })

    test('for event 2 with default values', () => {

        const guestData = {
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
        }

        const expected = {
            id: 5, eventId: 2,
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: null, exit: null, is_present: GuestStatus.NOTSET
        }

        return expect(addGuest(2, guestData)).resolves.toEqual(expected)
    })

    test('for CANCELED event', () => {

        const guestData = {
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: null, exit: null, is_present: 'NOTSET'
        }

        return expect(addGuest(1, guestData)).rejects.toThrow(AppError)
    })

    test('where guest enters before event start', () => {

        const guestData = {
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: new Date(2023,3,17,7,0), exit: new Date(2023,3,17,9,0), is_present: 'PRESENT'
        }

        return expect(addGuest(2, guestData)).rejects.toThrow(AppError)
    })

    test('where guest exits before event start', () => {

        const guestData = {
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: new Date(2023,3,17,8,0), exit: new Date(2023,3,17,10,0), is_present: 'PRESENT'
        }

        return expect(addGuest(2, guestData)).rejects.toThrow(AppError)
    })

    test('where is_present is not PRESENT and enter and exit is set', () => {

        const guestData = {
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: new Date(2023,3,17,8,0), exit: new Date(2023,3,17,9,0), is_present: 'NOTSET'
        }

        const expected = {
            id: 5, eventId: 2,
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: null, exit: null, is_present: GuestStatus.NOTSET
        }

        return expect(addGuest(2, guestData)).resolves.toEqual(expected)
    })

    test('for non existing event', () => {

        const guestData = {
            firstname: "Tom", lastname: "Hardy", age: 27, sex: "MALE", guest_image: "guest3.jpg",
            enter: null, exit: null, is_present: 'NOTSET'
        }

        return expect(addGuest(50, guestData)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 404,
            message: 'no event found with id 50'
        }))
    })
})

describe('getGuestById', () => {

    test('for id 1', () => {
        const expected = {
            id: 1, eventId: 4,
            firstname: "guest1", lastname: "guest1", age: 25, sex: "FEMALE", guest_image: "guest1.jpg",
            enter: null, exit: null, is_present: 'ABSENT'
        }

        return expect(getGuestById(1)).resolves.toEqual(expected)
    })

    test('for id 50', () => {
        return expect(getGuestById(50)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 404,
            message: 'no guest found with id 50',
        }))
    })
})

describe('getAllGuestsForEvent', () => { 

    test('for event 2', () => {
        const expected = [
            {
                id: 2, eventId: 2,
                firstname: "guest2", lastname: "guest2", age: 34, sex: "MALE", guest_image: "guest2.jpg",
                enter: null, exit: null, is_present: 'NOTSET'
            },
            
            {
                id: 3, eventId: 2,
                firstname: "guest3", lastname: "guest3", age: 27, sex: "MALE", guest_image: "guest3.jpg",
                enter: null, exit: null, is_present: 'NOTSET'
            }
        ]

        return expect(getAllGuestsForEvent(2)).resolves.toEqual(expected)
    })

    test('for event have no guests', () => {
        const expected = []

        return expect(getAllGuestsForEvent(3)).resolves.toEqual(expected)
    })

    test('for non existing event', () => {
        
        return expect(getAllGuestsForEvent(50)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 404,
            message: 'no event found with id 50'
        }))
    })
 })

 describe('searchGuestForEvent', () => { 

    test('for event 2 having matching keyword', () => {
        const filter = { k: '2' }

        const expected = [
            {
                id: 2, eventId: 2,
                firstname: "guest2", lastname: "guest2", age: 34, sex: "MALE", guest_image: "guest2.jpg",
                enter: null, exit: null, is_present: 'NOTSET'
            }
        ]

        return expect(searchGuestForEvent(2, filter)).resolves.toEqual(expected)
    })

    test('for event 2 having no matching keyword', () => {

        const filter = { k: '7' }

        const expected = []

        return expect(searchGuestForEvent(2, filter)).resolves.toEqual(expected)
    })

    test('for non existing event', () => {
        
        return expect(getAllGuestsForEvent(50)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 404,
            message: 'no event found with id 50'
        }))
    })
 })

describe('setGuest', () => {
    
    test('for id 1', () => {

        const guestData = {
            firstname: "guest2 updated", lastname: "guest2 updated", age: 35, sex: "MALE", guest_image: "guest2_new.jpg",
            enter: new Date(2023,3,17,8,0), exit: new Date(2023,3,17,8,30), is_present: 'PRESENT'
        }

        const expected = {
            oldGuest: {
                id: 2, eventId: 2,
                firstname: "guest2", lastname: "guest2", age: 34, sex: "MALE", guest_image: "guest2.jpg",
                enter: null, exit: null, is_present: 'NOTSET'
            },
            updatedGuest: {
                id: 2, eventId: 2,
                firstname: "guest2 updated", lastname: "guest2 updated", age: 35, sex: "MALE", guest_image: "guest2_new.jpg",
                enter: new Date(2023,3,17,8,0), exit: new Date(2023,3,17,8,30), is_present: GuestStatus.PRESENT
            }
        }

        return expect(setGuest(2, guestData)).resolves.toEqual(expected)
    })

    test('for non existing guest', () => {
        
        return expect(setGuest(50, {})).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 404,
            message: 'no guest found with id 50'
        }))
    })

    test('for event status FINISHED', () => {

        const guestData = {
            firstname: "guest1 updated", lastname: "guest1 updated", age: 26, sex: "FEMALE", guest_image: "guest1_new.jpg",
            enter: null, exit: null, is_present: 'NOTSET'
        }

        return expect(setGuest(1, guestData)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 422,
            message: 'event status FINISHED; can not modify guest list'
        }))
    })
 })

 describe('removeGuest', () => { 

    test('for id 2', () => {
        const expected = {
            id: 2, eventId: 2,
            firstname: "guest2", lastname: "guest2", age: 34, sex: "MALE", guest_image: "guest2.jpg",
            enter: null, exit: null, is_present: 'NOTSET'
        }

        return expect(removeGuest(2)).resolves.toEqual(expected)
    })

    test('for non existing guest', () => {
        return expect(removeGuest(50)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 404,
            message: 'no guest found with id 50'
        }))
    })

    test('for id 1', () => {
        return expect(removeGuest(1)).rejects.toThrow(expect.objectContaining({
            name: 'AppError',
            statusCode: 422,
            message: 'event status FINISHED; can not modify guest list'
        }))
    })
  })
