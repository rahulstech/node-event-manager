const joi = require('joi')
const utils = require('../../utils/helpers')

class InputValidationError extends Error {

    constructor(reason) {
        super()
        
        if (reason instanceof joi.ValidationError) {
            const message = JSON.stringify( reason.details.map( d => d.message ))
            this.message = message
        }
        else if (reason instanceof Error) {
            this.message = reason.message
        }
        else {
            this.message = reason
        }

        this.name = this.constructor.name
    }
}

const getJoiCustomDateTimeRule = () => (value, helpers) => {
    try {
        const validValue = utils.parseDateTime(value)
        return validValue
    }
    catch(error) {
        return helpers.error('any.custom', { error }) // TODO: provide good error message
    }
}

module.exports = {
    InputValidationError,
    getJoiCustomDateTimeRule
}