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

    test('missing start and missing end date', () => {
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

    test('end is before start', () => {
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: '2024-03-21 16:00',
            end: '2024-03-21 14:00',
            status: 'PENDING'
        }
    
        return expect(validateCreateEventBody(body)).rejects.toThrow(expect.objectContaining({
            name: 'InputValidationError',
            message: 'end must be after start'
        }))
    })

    test('invalid status', () => {
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: '2024-03-21 11:00',
            end: '2024-03-21 15:00',
            status: 'UNKNOWN'
        }
    
        return expect(validateCreateEventBody(body)).rejects.toThrow(expect.objectContaining({
            name: 'InputValidationError',
            message: '["\\\"status\\\" must be one of [PENDING, RUNNING, CANCELED, FINISHED]"]'
        }))
    })

    test('new start after new end', () => {
    
        const body = { 
            title: 'Annual Meeting',
            organizer: 'Microsoft',
            venu: 'London',
            description: 'This is annual general meeting of Microsoft.',
            start: '2024-03-21 11:00',
            end: '2024-03-21 15:00',
            status: 'PENDING',
            unknown: 'unknown value'
        }
    
        return expect(validateCreateEventBody(body))
                    .rejects.toThrow(expect.objectContaining({
                        name: 'InputValidationError',
                        message: '["\\\"unknown\\\" is not allowed"]'
                    }))
    })
})

// test suit for validateUpdateEvent

describe('validateUpdateEvent(body)', () => {

    const event = { 
        id: 1,
        title: 'Annual Meeting',
        organizer: 'Microsoft',
        venu: 'London',
        description: 'This is annual general meeting of Microsoft.',
        start: '2024-03-21 11:00',
        end: '2024-03-21 15:00',
        status: 'FINISHED'
    }

    test('all fields valid body', () => {
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
    
        return expect(validateUpdateEventBody(event, body)).resolves.toEqual(expected)
    })

    test('only title, organizer, venu, description valid body', () => {
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
    
        return expect(validateUpdateEventBody(event, body)).resolves.toEqual(expected)
    })

    test('missing start and missing end date', () => {
        const body = { 
            start: '2024-03-21',
            end: '15:00',
        }
    
        return expect(validateUpdateEventBody(event, body))
                .rejects.toThrow(InputValidationError)
    })

    test('invalid status', () => {
        const body = { 
            status: 'UNKNOWN'
        }
    
        return expect(validateUpdateEventBody(event, body))
                .rejects.toThrow(expect.objectContaining({
                    name: 'InputValidationError',
                    message: '["\\\"status\\\" must be one of [PENDING, RUNNING, CANCELED, FINISHED]"]'
                }))
    })

    test('new end before existing start', () => {
        const body = { 
            end: '2024-03-21 10:00'
        }
    
        return expect(validateUpdateEventBody(event, body))
                    .rejects.toThrow(expect.objectContaining({
                        name: 'InputValidationError',
                        message: 'end must be after start'
                    }))
    })

    test('new start after existing end', () => {
        const body = { 
            start: '2024-03-21 16:00'
        }
    
        return expect(validateUpdateEventBody(event, body))
                    .rejects.toThrow(expect.objectContaining({
                        name: 'InputValidationError',
                        message: 'end must be after start'
                    }))
    })

    test('new start after new end', () => {
        const body = { 
            start: '2024-03-21 16:00',
            end: '2024-03-21 15:00'
        }
    
        return expect(validateUpdateEventBody(event, body))
                    .rejects.toThrow(expect.objectContaining({
                        name: 'InputValidationError',
                        message: 'end must be after start'
                    }))
    })

    test('new start after new end', () => {
        const body = { 
            unknown: 'unknown value'
        }
    
        return expect(validateUpdateEventBody(event, body))
                    .rejects.toThrow(expect.objectContaining({
                        name: 'InputValidationError',
                        message: '["\\\"unknown\\\" is not allowed"]'
                    }))
    })
})


