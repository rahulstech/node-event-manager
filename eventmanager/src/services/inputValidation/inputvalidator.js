const joi = require('joi')

const utils = require('../../utils/helpers')

const { AppError } = require('../../utils/errors')

const { isDate } = require('node:util/types')

class InputValidationError extends AppError {

    constructor(reason) {
        super(reason, 400)
    }
}

const validate = async ( schema, value, options = { abortEarly: false, allowUnknown: true } ) => {
     try {

        const compiled = joi.compile(schema).messages({
            'datetime': "{{ #reason }}"
        })

        const validValue = await schema.validateAsync(value, options)
        return validValue
     }
     catch(err) {
        if (err instanceof joi.ValidationError) {

            const message = JSON.stringify(err.details.map( d => d.message ))

            throw new InputValidationError(message)
        }
     }
}

const getJoiCustomDateTimeRule = () => (value, helpers) => {

    try {
        const validValue = utils.parseDateTime(value)
        return validValue
    }
    catch(error) {
        return helpers.error('datetime', { reason: error.message }) // TODO: provide good error message
    }
}

module.exports = {

    InputValidationError,

    getJoiCustomDateTimeRule,

    validate
}