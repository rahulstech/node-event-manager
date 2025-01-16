const moment = require('moment')

/** Date Time */

class DateTimeError extends Error {

    constructor(message='') {
        super(message)
    }
}

const parseDateTime = (datetimeText) => {
    const result = moment(datetimeText, 'YYYY-MM-DD HH:mm', true)
    if (!result.isValid()) {
        throw new DateTimeError(`'${datetimeText}' is not a valid date time text in the format 'YYYY-MM-DD HH:mm'`)
    }

    return result.toDate()
}

const formatDateTime = (dateObj) => {
    if (!dateObj) {
        throw new DateTimeError('no Date object provided')
    }

    const result = moment(dateObj, true)
    if (!result.isValid()) {
        throw new DateTimeError('invalid Date object provided')
    }

    return result.format('YYYY-MM-DD HH:mm')
}


module.exports = {
    DateTimeError,
    parseDateTime, formatDateTime,
}