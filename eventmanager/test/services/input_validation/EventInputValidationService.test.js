const { EventStatus } = require('../../../src/database/eventsdb')
const { validateCreateEventBody, validateUpdateEventBody } = require('../../../src/services/input_validation/EventInputValidationService')
const { InputValidationError } = require('../../../src/services/input_validation/inputvalidator')

// test suit for validateCreateEvent 

describe('validateCreateEvent(body)', () => {

    test('valid body', () => {
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: '2024-03-21 11:00',
            end: '2024-03-21 15:00',
        }
    
        const expected = {
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: new Date(2024, 2, 21, 11, 0),
            end: new Date(2024, 2, 21, 15, 0),
            status: 'PENDING'
        }
    
        return expect(validateCreateEventBody(body)).resolves.toEqual(expected)
    })

    test('validateCreateEvent: missing start and missing end date', () => {
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: '2024-03-21',
            end: '15:00',
            status: 'PENDING'
        }
    
        return expect(validateCreateEventBody(body)).rejects.toThrow(InputValidationError)
    })

    test('validateCreateEvent: invalid status', () => {
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: '2024-03-21 11:00',
            end: '2024-03-21 15:00',
            status: 'UNKNOWN'
        }
    
        return expect(validateCreateEventBody(body)).rejects.toThrow(InputValidationError)
    })
})

// test suit for validateUpdateEvent

describe('validateUpdateEvent(body)', () => {

    test('validateUpdateEvent: all fields valid body', () => {
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: '2024-03-21 11:00',
            end: '2024-03-21 15:00',
            status: 'FINISHED'
        }
    
        const expected = {
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: new Date(2024, 2, 21, 11, 0),
            end: new Date(2024, 2, 21, 15, 0),
            status: 'FINISHED'
        }
    
        return expect(validateUpdateEventBody(body)).resolves.toEqual(expected)
    })

    test('validateUpdateEvent: only title, organizer, venu, description valid body', () => {
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
        }
    
        const expected = {
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
        }
    
        return expect(validateUpdateEventBody(body)).resolves.toEqual(expected)
    })

    test('validateUpdateEvent: missing start and missing end date', () => {
        const body = { 
            start: '2024-03-21',
            end: '15:00',
        }
    
        return expect(validateUpdateEventBody(body))
                .rejects.toThrow(InputValidationError)
    })

    test('validateUpdateEvent: invalid status', () => {
        const body = { 
            status: 'UNKNOWN'
        }
    
        return expect(validateUpdateEventBody(body))
                .rejects.toThrow(InputValidationError)
    })
})


