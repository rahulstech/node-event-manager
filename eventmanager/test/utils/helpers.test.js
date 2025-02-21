const { parseDateTime, formatDateTime, isDateTimeAfter, DateTimeError, copyNameValuePairs, renameKeys } = require('../../src/utils/helpers')

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

describe('copyNameValuePairs', () => {

    test('all string keys', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [ 'name', 'number', 'frequency' ]
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', frequency: 'Once Monthly' }

        expect(copyNameValuePairs(keys, source)).toEqual(expected)
    })

    test('array key', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [ 'name', 'number', ['frequency', 'runs'] ]
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', runs: 'Once Monthly' }

        expect(copyNameValuePairs(keys, source)).toEqual(expected)
    })

    test('null target', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [ 'name', 'number', 'frequency' ]
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', frequency: 'Once Monthly' }

        expect(copyNameValuePairs(keys, source, null)).toEqual(expected)
    })

    test('predefined target', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [ 'name', 'number' ]
        const target = { source: 'Bangalore' }
        const expected = { source: 'Bangalore', name: 'Bangalore - Kolkata Express', number: '154788'}

        expect(copyNameValuePairs(keys, source, target)).toEqual(expected)
    })

    test('default value provider', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [ 'name', 'number', 'avg_delay' ]
        const defaultValueProvider = (key) => {
            if (key === 'avg_delay') {
                return 0
            }
            return undefined
        }
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', avg_delay: 0 }

        expect(copyNameValuePairs(keys, source, null, { defaultValueProvider })).toEqual(expected)
    })
})

describe('renameKeys', () => {

    test('all source keys exists', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [['start', 'journey_start'], ['end', 'journey_end']]
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', journey_start: '23:05', journey_end: '03:25', frequency: 'Once Monthly' }

        expect(renameKeys(keys, source)).toEqual(expected)
    })

    test('some key does not exist', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [['start', 'journey_start'], ['delay', 'avg_delay']]
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', journey_start: '23:05', end: '03:25', frequency: 'Once Monthly' }

        expect(renameKeys(keys, source)).toEqual(expected)
    })

    // test('null target', () => {
    //     const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
    //     const keys = [ 'name', 'number', 'frequency' ]
    //     const expected = { name: 'Bangalore - Kolkata Express', number: '154788', frequency: 'Once Monthly' }

    //     expect(copyNameValuePairs(keys, source, null)).toEqual(expected)
    // })

    // test('predefined target', () => {
    //     const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
    //     const keys = [ 'name', 'number' ]
    //     const target = { source: 'Bangalore' }
    //     const expected = { source: 'Bangalore', name: 'Bangalore - Kolkata Express', number: '154788'}

    //     expect(copyNameValuePairs(keys, source, target)).toEqual(expected)
    // })

    test('default value provider', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly' }
        const keys = [['delay', 'avg_delay']]
        const defaultValueProvider = (key) => {
            if (key === 'avg_delay') {
                return 0
            }
            return undefined
        }
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly', avg_delay: 0 }

        expect(renameKeys(keys, source, { defaultValueProvider })).toEqual(expected)
    })

    test('converted value provider', () => {
        const source = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly', ticket_price: 90 }
        const keys = [['ticket_price', 'ticket_price_with_tax']]
        const valueConverter = (key, value) => {
            if (key === 'ticket_price_with_tax') {
                return value + 10
            }
            return undefined
        }
        const expected = { name: 'Bangalore - Kolkata Express', number: '154788', start: '23:05', end: '03:25', frequency: 'Once Monthly', ticket_price_with_tax: 100 }

        expect(renameKeys(keys, source, { valueConverter })).toEqual(expected)
    })
})