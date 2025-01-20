
require('../../mocks/mock_eventsdb').mockEventDB()

const { EventStatus } = require("../../../src/database/eventsdb")

const { ensureConsistentGuestData } = require("../../../src/services/dataService/GuestDataService")

describe('ensureConsistentGuestData', () => {

    test('valid data', () => {
        const event = {
            start: new Date(2024, 5, 4, 7, 15),
    
            end: new Date(2024, 5, 4, 8, 45),
    
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
            start: new Date(2024, 5, 4, 7, 15),
    
            end: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {}
    
        expect(() => ensureConsistentGuestData(event, guestData)).not.toThrow()
    })

    test('enter not between event start and end', () => {
        const event = {
            start: new Date(2024, 5, 4, 7, 15),
    
            end: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {
            enter: new Date(2024, 5, 4, 7, 0),
    
            exit: new Date(2024, 5, 4, 8, 20),
        }
    
        expect(() => ensureConsistentGuestData(event, guestData))
        .toThrow(expect.objectContaining({
            message: '["\\\"enter\\\" must be between event start and end"]'
        }))
    })

    test('exit not between event start and end', () => {
        const event = {
            start: new Date(2024, 5, 4, 7, 15),
    
            end: new Date(2024, 5, 4, 8, 45),
    
            status: EventStatus.PENDING
        }
    
        const guestData = {
            enter: new Date(2024, 5, 4, 7, 30),
    
            exit: new Date(2024, 5, 4, 9, 0),
        }
    
        expect(() => ensureConsistentGuestData(event, guestData))
        .toThrow(expect.objectContaining({
            message: '["\\\"exit\\\" must be between event start and end"]'
        }))
    })

    test('event status CANCELED', () => {
        const event = {
            status: EventStatus.CANCELED
        }
    
        const guestData = {}
    
        expect(() => ensureConsistentGuestData(event, guestData)).toThrow(expect.objectContaining({
            message: 'event status CANCELED; can not modify guest'
        }))
    })

    test('event status FINISHED', () => {
        const event = {
            status: EventStatus.FINISHED
        }
    
        const guestData = {}
    
        expect(() => ensureConsistentGuestData(event, guestData)).toThrow(expect.objectContaining({
            message: 'event status FINISHED; can not modify guest'
        }))
    })
})
