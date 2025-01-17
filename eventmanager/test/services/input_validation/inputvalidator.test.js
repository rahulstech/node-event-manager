const joi = require('joi')
const { getJoiCustomDateTimeRule } = require("../../../src/services/input_validation/inputvalidator");


describe('getJoiCustomDateTimeRule()', () => {

    const schema = joi.object({
        datetime: joi.string().custom(getJoiCustomDateTimeRule())
    })

    test('valid date and time', () => {
        
        const expected = { datetime: new Date(2024, 4, 6, 14, 30)}
    
        const { value } = schema.validate({ datetime: '2024-05-06 14:30'})
    
       expect(value).toEqual(expected)
    })

    test('only date', () => {
        const data = { datetime: '2024-05-06'}
        
       return expect(schema.validateAsync(data))
        .rejects.toThrow()
    })

    test('only time', () => {
        const data = { datetime: '14:55'}
        
       return expect(schema.validateAsync(data))
        .rejects.toThrow()
    })

    test('invalid date and time', () => {

        const data = { datetime: '2024-05-32 14:61'}
    
       return expect(schema.validateAsync(data)).rejects.toThrow()
    })

    test('invalid date and valid time', () => {

        const data = { datetime: '2024-05-32 14:30'}
    
       return expect(schema.validateAsync(data)).rejects.toThrow()
    })

    test('valid date and invalid time', () => {

        const data = { datetime: '2024-05-28 14:61'}
    
       return expect(schema.validateAsync(data)).rejects.toThrow()
    })
})
