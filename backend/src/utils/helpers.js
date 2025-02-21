const moment = require('moment')

/** Date Time */

class DateTimeError extends Error {

    constructor(message='') {
        super(message)
        this.name = this.constructor.name
    }
}

const parseDateTime = (datetimeText) => {
    const result = moment(datetimeText, 'YYYY-MM-DD HH:mm', true)
    if (!result.isValid()) {
        // TODO: provide more detailed error message
        // case not covered in error like 
        // "2024-05-32 14:30" : invalid date 32
        // "2024-05-28 25:30" : invalid hour of day 25 
        // "2024-13-21 14:30" : invalid month 13
        // "2024-05-28 14:65" : invalid minute 65
        // etc.
        throw new DateTimeError(`'${datetimeText}' is not a valid date time text in the format 'YYYY-MM-DD HH:mm'`)
    }

    return result.toDate()
}

const formatDateTime = (dateObj) => {
    if (!dateObj || dateObj.constructor.name != 'Date') {
        throw new DateTimeError('no Date object provided')
    }

    const result = moment(dateObj, true)
    if (!result.isValid()) {
        throw new DateTimeError('invalid Date object provided')
    }

    return result.format('YYYY-MM-DD HH:mm')
}

const pushValidBody = (req, what) => {
    const validBody = req.validBody
    if (!validBody) {
        req.validBody = { ...what }
    }
    else {
        req.validBody = { ...validBody, ...what }
    }
}

const pushValidParams = (req, what) => {
    const validParams = req.validParams
    if (!validParams) {
        req.validParams = { ...what }
    }
    else {
        req.validParams = { ...validParams, ...what }
    }
}

const pushValidQuery = (req, what) => {
    const validQuery = req.validQuery
    if (!validQuery) {
        req.validQuery = { ...what }
    }
    else {
        req.validQuery = { ...validQuery, ...what }
    }
}

const isDateTimeBetween = (testDt, startDt, endDt, inclusive = true) => {
    return isDateTimeBefore(testDt, endDt, inclusive) && isDateTimeAfter( testDt, startDt, inclusive)
}

const isDateTimeBefore = (testDt, endDt, inclusive = false ) => {
    return isDateTimeAfter(endDt, testDt, inclusive)
}

const isDateTimeAfter = (testDt, startDt, inclusive = false ) => {
    const momentStart = moment(startDt)
    const momentTest = moment(testDt)
    if (inclusive) {
        return momentStart.isSameOrBefore(momentTest)
    }
    else {
        return momentStart.isBefore(momentTest)
    }
}

const enumValues = ( enumClass ) => {
    return Object.values(enumClass)
            .filter( value => typeof value === 'string' )
}

const copyNameValuePairs = (keys, source, target = {}, options = null) => {
    
    if (target === null || target === undefined) {
        target = {}
    }

    if (source === undefined || source === null) {
        return target
    }

    const { defaultValueProvider, valueConverter } = options || {}

    keys.forEach( key => {
        const type = key.constructor.name

        let tKey, tVal

        if (type === 'String') {
            tKey = key
            tVal = source[key]
        }
        else if (type === 'Array') {
            const [ srcKey, destKey ] = key
            tKey = destKey
            tVal = source[srcKey]
        }

        if ( tVal === undefined ) {
            if (defaultValueProvider) {
                target[tKey] = defaultValueProvider(tKey)
            }
        }
        else if (valueConverter) {
            target[tKey] = valueConverter(key, tVal)
        }
        else {
            target[tKey] = tVal
        }
    })

    return target
}

const renameKeys = (keys, source, options = null) => {
    
    if (!source) {
        return {}
    }

    const { defaultValueProvider, valueConverter } = options || {}

    const destination = { ...source }

    keys.forEach( ([srcKey, destKey]) => {
        
        const value = source[srcKey]

        delete destination[srcKey]

        if (value === undefined) {
            if (defaultValueProvider) {
                destination[destKey] = defaultValueProvider(destKey)
            }
        }
        else if (valueConverter) {
            destination[destKey] = valueConverter(destKey, value)
        }
        else {
            destination[destKey] = value
        }
    })

    return destination
}

module.exports = {
    DateTimeError,
    parseDateTime, formatDateTime, isDateTimeBetween, isDateTimeBefore, isDateTimeAfter,
    pushValidBody, pushValidParams, pushValidQuery, 
    enumValues, copyNameValuePairs, renameKeys
}