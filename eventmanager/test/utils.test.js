const utils = require('../src/utils/helpers')

function test_formatDateTime() {
    const validInput = new Date(2023,4,16,14,5)
    const datetime = utils.formatDateTime(validInput)

    console.log(`'${validInput}' = ${datetime}`)   
}

describe('parseDateTime', () => {

    test('parseDateTime for valid input', () => {
        const validInput = "2024-05-16 14:35"
        const actual = utils.parseDateTime(validInput)
        const expected = new Date(2024,4,16,14,35)

        expect(actual).not.toBeNull()
        expect(actual).toEqual(expected)
    })

    test('parseDateTime invalid input: only date', () => {
        const onlyDateInput = '2024-05-16'
        const runParse = () => {
            utils.parseDateTime(onlyDateInput)
        }

        expect(runParse).toThrow(utils.DateTimeError)
    })

    test('parseDateTime invalid input: only time', () => {
        const onlyTimeInput = '14:35'
        const runParse = () => {
            utils.parseDateTime(onlyTimeInput)
        }

        expect(runParse).toThrow(utils.DateTimeError)
    })

    test('parseDateTime invalid input: empty or undefined input', () => {
        const invalidInput = null
        const runParse = () => {
            utils.parseDateTime(invalidInput)
        }
        expect(runParse).toThrow(utils.DateTimeError)
    })

    test('parseDateTime invalid input: date in wrong format but time in right format', () => {
        const invalidInput = '2024/05/16 14:35'
        const runParse = () => {
            utils.parseDateTime(invalidInput)
        }
        expect(runParse).toThrow(utils.DateTimeError)
    })

    test('parseDateTime invalid input: time in wrong format but date in right format', () => {
        const invalidInput = '2024-05-16 14-35-55'
        const runParse = () => {
            utils.parseDateTime(invalidInput)
        }
        expect(runParse).toThrow(utils.DateTimeError)
    })
})

describe('formatDateTime', () => {

    test('formatDateTime for valid input', () => {
        const validInput = new Date(2024,4,16,14,30)
        const actual = utils.formatDateTime(validInput)
        const expected = "2024-05-16 14:30"

        expect(actual).toBe(expected)
    })

    test('formatDateTime for null input', () => {
        const invalidInput = null
        const runFormat = () => {
            utils.formatDateTime(invalidInput)
        }
        expect(runFormat).toThrow(utils.DateTimeError)
    })
})
