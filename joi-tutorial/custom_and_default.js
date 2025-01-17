/**
 * learning:
 * 
 * 1. original vs value returned by validate: value returned returned by validate is more useful it contains the default value for 
 *     unset fields in orginal, if mentioned in schema. also the converts the the data type on pass. for example: if 'field1' is mumber
 *     and in orignal field1 = '456', a number string, then schema successfully pass and it convertes field1 from string to number.
 *     
 *     original = { field1 : '456' } => value = { field1 : 456 }
 * 
 * 2. custom rule and error: .custom() takes a callback with two parameter callback(value, helpers). value is the value converted and valid
 *    all the rules before it. for example: joi.number().custom((value, helpers) => {}) then value will a valid number. return undefined to
 *    keep the value unset in schema.validate() returned value or return a value after properly validating and converting it. 
 *    return helpers.error(Error or 'name of joi error') if validation fails.
 */

const joi = require('joi')
const moment = require('moment')

// a function to calculate the default value of a field from other valid values
function getDefaultValueForField_DefaultValueTwo( parent, helpers ) {
    // i can use parent to get valid values to calculate the default value

    if (parent.n) {
        const value = parent.n * parent.p
        return value
    }
    
    // return undefined to keep the feild unset
    return undefined
}

const schema = joi.object({
    date: joi.string().custom((value, helpers) => {
        const regex = /\d{4}-\d{2}-\d{2}/
        if (!regex.test(value)) {
            return helpers.error('object.regex')
        }

        try {
            const validValue = moment(value, 'YYYY-MM-DD', true).toDate()
            return validValue
        }
        catch(err) {
            return helpers.error(err)
        } 
    }),

    type: joi.string()
            .default('DOB'), // a static value as default value

    defaultFieldTwo: joi.number()
                    .default(getDefaultValueForField_DefaultValueTwo), // a function reference as default value, it will calculate the default value

    n: joi.number(),
    p: joi.number().required()

})

function validate(original) {
    
    const { error, value } = schema.validate(original)

    if (error) {
        console.log(original, ' is not valid')
    }
    else {
        console.log('original: ', original, ' value: ', value)
    }
    console.log("==============================")
}

const originals = [
    { date: '2025-06' },
    { date: '2025-05-06', p: 3 },
    { date: '2025-05-06', n: 5, p: 3 },
    { date: '2025-05-06', n: 5, p: 3, type: 'DOJ' },
    { date: '2025-05-06', n: 'hello', p: 3, type: 'DOJ' },
]

originals.forEach(validate)

