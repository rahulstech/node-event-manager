const joi = require('joi')
const utils = require('../../utils/helpers')

class InputValidationError extends Error {

    constructor(reason) {
        if (reason instanceof joi.ValidationError) {
            super(JSON.stringify(reason.details.map( d => d.message )))
        }
        else if (reason instanceof Error) {
            super(reason.message)
        }
        else {
            super(reason)
        }
    }
}

const getJoiCustomDateTimeRule = () => (value, helpers) => {
    try {
        const validValue = utils.parseDateTime(value)
        return validValue
    }
    catch(err) {
        return helpers.error(err) // TODO: error in err code
    }
}

module.exports = {
    InputValidationError,
    getJoiCustomDateTimeRule
}