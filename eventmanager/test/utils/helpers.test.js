const { parseDateTime, formatDateTime, isDateTimeAfter, DateTimeError } = require('../../src/utils/helpers')

describe('parseDateTime', () => {

    test('for valid input', () => {
        const validInput = "2024-05-16 14:35"
        const actual = parseDateTime(validInput)
        const expected = new Date(2024,4,16,14,35)

        expect(actual).not.toBeNull()
        expect(actual).toEqual(expected)
    })

    test('invalid input: only date', () => {
        const onlyDateInput = '2024-05-16'
        const runParse = () => {
            parseDateTime(onlyDateInput)
        }

        expect(runParse).toThrow(DateTimeError)
    })

    test('invalid input: only time', () => {
        const onlyTimeInput = '14:35'
        const runParse = () => {
            parseDateTime(onlyTimeInput)
        }

        expect(runParse).toThrow(DateTimeError)
    })

    test('invalid input: empty or undefined input', () => {
        const invalidInput = null
        const runParse = () => {
            parseDateTime(invalidInput)
        }
        expect(runParse).toThrow(DateTimeError)
    })

    test('invalid input: date in wrong format but time in right format', () => {
        const invalidInput = '2024/05/16 14:35'
        const runParse = () => {
            parseDateTime(invalidInput)
        }
        expect(runParse).toThrow(DateTimeError)
    })

    test('invalid input: time in wrong format but date in right format', () => {
        const invalidInput = '2024-05-16 14-35-55'
        const runParse = () => {
            parseDateTime(invalidInput)
        }
        expect(runParse).toThrow(DateTimeError)
    })
})

describe('formatDateTime', () => {

    test('for valid input', () => {
        const validInput = new Date(2024,4,16,14,30)
        const actual = formatDateTime(validInput)
        const expected = "2024-05-16 14:30"

        expect(actual).toBe(expected)
    })

    test('for null input', () => {
        const invalidInput = null
        const runFormat = () => {
            formatDateTime(invalidInput)
        }
        expect(runFormat).toThrow(DateTimeError)
    })
})


describe('isDateTimeAfter', () => {

    test('testDt > endDt', () => {
        const testDt = new Date(2024, 6, 1)
        const endDt = new Date(2024, 5, 1)
        const expected = true

        expect(isDateTimeAfter(testDt, endDt)).toBe(expected)
    })

    test('testDt < endDt', () => {
        const testDt = new Date(2024, 5, 1)
        const endDt = new Date(2024, 6, 1)
        const expected = false

        expect(isDateTimeAfter(testDt, endDt)).toBe(expected)
    })

    test('testDt = endDt', () => {
        const date = new Date(2024, 5, 1)
        const expected = false

        expect(isDateTimeAfter(date, date)).toBe(expected)
    })

    test('testDt = endDt inclusive', () => {
        const testDt = new Date(2024, 5, 1)
        const endDt = new Date(2024, 5, 1)
        const expected = true

        expect(isDateTimeAfter(testDt, endDt, true)).toBe(expected)
    })

    test('testDt > endDt inclusive', () => {
        const testDt = new Date(2024, 6, 1)
        const endDt = new Date(2024, 5, 1)
        const expected = true

        expect(isDateTimeAfter(testDt, endDt, true)).toBe(expected)
    })

    test('testDt < endDt inclusive', () => {
        const testDt = new Date(2024, 5, 1)
        const endDt = new Date(2024, 6, 1)
        const expected = false

        expect(isDateTimeAfter(testDt, endDt, true)).toBe(expected)
    })
})

