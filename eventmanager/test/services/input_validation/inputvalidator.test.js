const joi = require('joi')
const { getJoiCustomDateTimeRule } = require("../../../src/services/input_validation/inputvalidator")

describe('getJoiCustomDateTimeRule()', () => {

    test('valid date and time', () => {
        
        const expected = new Date(2024, 4, 6, 14, 30)

        const datetime = '2024-05-06 14:30'
    
        return expect(joi.custom(getJoiCustomDateTimeRule()).validateAsync(datetime))
                .resolves.toEqual(expected)
    })

    test('invalid date and time', () => {
        const datetime = '2024-05-32 14:65'
        
       return expect(joi.custom(getJoiCustomDateTimeRule()).validateAsync(datetime))
        .rejects.toThrow(expect.objectContaining({
            name: 'ValidationError',
            message: `\"value\" failed custom validation because '${datetime}' is not a valid date time text in the format 'YYYY-MM-DD HH:mm'`
        }))
    })
})
