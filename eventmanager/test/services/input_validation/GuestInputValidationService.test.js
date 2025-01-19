const { GuestStatus } = require("../../../src/database/eventsdb");
const { validateAddGuestBody, validateUpdateGuestBody } = require("../../../src/services/input_validation/GuestInputValidationService");

// test for validateAddGuestBody

describe('validateAddGuestBody( body )', () => {

    test('valid input', () => {
        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: '2024-05-16 14:30',
            exit: '2024-05-16 15:30',
            is_present: 'PRESENT'
        }

        const file = {
            filename: 'image.jpg'
        }

        const expected = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: new Date(2024, 4, 16, 14, 30),
            exit: new Date(2024, 4, 16, 15, 30),
            is_present: GuestStatus.PRESENT,
            guest_image: 'image.jpg'
        }

        return expect(validateAddGuestBody(body, file))
        .resolves.toEqual(expected)
    })

    test('autoset default is_present', () => {
        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
        }

        const file = {
            filename: 'image.jpg'
        }

        const expected = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            is_present: GuestStatus.NOTSET,
            guest_image: 'image.jpg'
        }

        return expect(validateAddGuestBody(body, file))
        .resolves.toEqual(expected)
    })

    test('is_present != PRESENT and enter and exit is set', () => {
        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: '2024-05-16 14:30',
            exit: '2024-05-16 15:30'
        }

        const file = {
            filename: 'image.jpg'
        }

        const expected = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: new Date(2024, 4, 16, 14, 30),
            exit: new Date(2024, 4, 16, 15, 30),
            is_present: GuestStatus.NOTSET,
            guest_image: 'image.jpg'
        }

        return expect(validateAddGuestBody(body, file))
                .resolves.toEqual(expected)
    })

    test('invalid is_present', () => {

        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: '2024-05-16 14:30',
            exit: '2024-05-16 15:30',
            is_present: 'UNKNOWN'
        }

        const file = {
            filename: 'image.jpg'
        }

        return expect(validateAddGuestBody(body, file))
        .rejects.toThrow(expect.objectContaining({
            name: 'InputValidationError',
            message: '["\\\"is_present\\\" must be one of [NOTSET, PRESENT, ABSENT]"]'
        }))
    })

    test('missing fields', () => {

        const body = {}

        const file = {}

        return expect(validateAddGuestBody(body, file))
        .rejects.toThrow(expect.objectContaining({
            name: 'InputValidationError',
            message: '["\\\"firstname\\\" is required","\\\"lastname\\\" is required","\\\"sex\\\" is required","\\\"age\\\" is required","\\\"guest_image\\\" is required"]'
        }))
    })

    test('invalid sex', () => {

        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'UNKNOWN',
            age: 34
        }

        const file = {
            filename: 'image.jpg'
        }

        return expect(validateAddGuestBody(body, file))
        .rejects.toThrow(expect.objectContaining({
            name: 'InputValidationError',
            message: '["\\\"sex\\\" must be one of [MALE, FEMALE, OTHER]"]'
        }))
    })

    test('is_present = PRESENT but no enter and exit', () => {
        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            is_present: 'PRESENT'
        }

        const file = {
            filename: 'image.jpg'
        }

        return expect(validateAddGuestBody(body, file))
                .rejects.toThrow(expect.objectContaining({
                    name: 'InputValidationError',
                    message: 'enter and exit is required when is_present is PRESENT'
                }))
    })
})

// test for validateUpdateGuestBody

describe('validateUpdaytGuestBody( body )', () => {

    test('valid input', () => {
        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: '2024-05-16 14:30',
            exit: '2024-05-16 15:30',
            is_present: 'PRESENT'
        }

        const expected = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: new Date(2024, 4, 16, 14, 30),
            exit: new Date(2024, 4, 16, 15, 30),
            is_present: GuestStatus.PRESENT
        }

        return expect(validateUpdateGuestBody(body))
                .resolves.toEqual(expected)
    })

    test('only firstname, lastname, sex, age, valid input', () => {
        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34
        }

        const expected = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34
        }

        return expect(validateUpdateGuestBody(body))
        .resolves.toEqual(expected)
    })

    test('invalid is_present', () => {

        const body = {
            is_present: 'UNKNOWN'
        }

        return expect(validateUpdateGuestBody(body))
        .rejects.toThrow(expect.objectContaining({
            name: 'InputValidationError',
            message: `["\\\"is_present\\\" must be one of [${GuestStatus.NOTSET}, ${GuestStatus.PRESENT}, ${GuestStatus.ABSENT}]"]`
        }))
    })

    test('invalid sex', async () => {

        const body = {
            sex: 'UNKNOWN'
        }

        return expect(validateUpdateGuestBody(body))
        .rejects.toThrow(expect.objectContaining({
            name: 'InputValidationError',
            message: '["\\\"sex\\\" must be one of [MALE, FEMALE, OTHER]"]'
        }))
    })
})