const { GuestStatus } = require("../../../src/database/eventsdb");
const { validateAddGuestBody, validateUpdateGuestBody } = require("../../../src/services/input_validation/GuestInputValidationService");
const { InputValidationError } = require("../../../src/services/input_validation/inputvalidator");

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

        const expected = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
            age: 34,
            enter: new Date(2024, 4, 16, 14, 30),
            exit: new Date(2024, 4, 16, 15, 30),
            is_present: GuestStatus.PRESENT
        }

        return expect(validateAddGuestBody(body))
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

        return expect(validateAddGuestBody(body))
        .rejects.toThrow(InputValidationError)
    })

    test('missing field age', () => {

        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'MALE',
        }

        return expect(validateAddGuestBody(body))
        .rejects.toThrow(InputValidationError)
    })

    test('invalid sex', () => {

        const body = {
            firstname: "Bill",
            lastname: "Gates",
            sex: 'UNKNOWN',
            age: 34
        }

        return expect(validateAddGuestBody(body))
        .rejects.toThrow(InputValidationError)
    })
})

// test for validateUpdateGuestBody
// describe('validateUpdateGuestBody( body )', () => {})