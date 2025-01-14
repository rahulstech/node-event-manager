const moment = require('moment')

class DateTimeError extends Error {

    constructor(message='') {
        super(message)
    }
}

const parseDateTime = (datetimeText) => {
    // if (!datetimeText) {
    //     throw new DateTimeError('invalid date time text')
    // }
    // try {
    //     const [ date, time ] = datetimeText.split(' ', 2) // split by single space
    //     if (!date || !time) {
    //         // in not in '<date><sp><time>' format
    //         throw new DateTimeError(`'${datetimeText}' is not in format '<date> <sp> <time>'`)
    //     }
    //     const [ year, month, dayOfMonth ] = date.split('-', 3)
    //     if (!year || !month || !dayOfMonth) {
    //         // date not in year-month-dayOfMonth format
    //         throw new DateTimeError(`'date in '${datetimeText}' is not in year-month-dayOfMonth format`)
    //     }
    //     const [ hourOfDay, minute ] = time.split(':', 2)
    //     if (!hourOfDay || !minute) {
    //         // time not in hourOfDay:minute format
    //         throw new DateTimeError(`time in '${datetimeText}' is not in hourOfDay-minute format`)
    //     }

    //     const yyyy = Number(year)
    //     const MM = Number(month)
    //     const dd = Number(dayOfMonth)
    //     const HH = Number(hourOfDay)
    //     const mm = Number(minute) 

    //     return new Date(yyyy, MM-1, dd, HH, mm, 0, 0)
    // }
    // catch(err) {
    //     if (err instanceof DateTimeError) {
    //         throw err
    //     }
    //     else {
    //         throw new DateTimeError(`can not parse ${datetimeText}`, err)
    //     }
    // }

    const result = moment(datetimeText, 'YYYY-MM-DD HH:mm', true)
    if (!result.isValid()) {
        throw new DateTimeError(`'${datetimeText}' is not a valid date time text in the format 'YYYY-MM-DD HH:mm'`)
    }

    return result.toDate()
}

const formatDateTime = (dateObj) => {
    // if (!dateObj || !(dateObj instanceof Date)) {
    //     throw new DateTimeError('formatDateTime requires a Date object')
    // }
    // try {
    //     const yyyy = dateObj.getFullYear()
    //     const MM = dateObj.getMonth() + 1
    //     const dd = dateObj.getDate()
    //     const HH = dateObj.getHours()
    //     const mm = dateObj.getMinutes()

    //     Intl.DateTimeFormat
    //     const dateTimeText = `${year}-`
    // }
    // catch(err) {

    // }

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