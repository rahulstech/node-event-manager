const joi = require('joi')
const utils = require('../../utils/helpers')
const { AppError } = require('../../utils/errors')

const validate = async ( schema, value, options = { abortEarly: false, allowUnknown: true } ) => {
     try {
        const compiled = joi.compile(schema).messages({
            'datetime': "{{ #reason }}"
        })
        const validValue = await compiled.validateAsync(value, options)
        return validValue
     }
     catch(err) {
        if (err instanceof joi.ValidationError) {
            const message = JSON.stringify(err.details.map( d => d.message ))
            throw new AppError(message, 400)
        }
        else {
            throw err
        }
     }
}

const getJoiCustomDateTimeRule = () => (value, helpers) => {
    if (value === undefined || null === value) {
        return value
    }
    
    try {
        const validValue = utils.parseDateTime(value)
        return validValue
    }
    catch(error) {
        return helpers.error('datetime', { reason: error.message }) // TODO: provide good error message
    }
}

module.exports = {
    getJoiCustomDateTimeRule, validate
}