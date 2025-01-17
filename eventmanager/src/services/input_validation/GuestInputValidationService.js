const joi = require('joi')
const { Sex, GuestStatus } = require('../../database/eventsdb')
const loggers = require('../../utils/loggers')
const { InputValidationError, getJoiCustomDateTimeRule } = require('./inputvalidator')

const logger = loggers.logger.child({ module: 'GuestInputValidationService' })



const field_firstname = joi.string()

const field_lastname = joi.string()

const field_sex = joi.string().valid(...Sex.values())

const field_age = joi.number().min(0) // TODO: should change min age ?

const field_enter = joi.string().custom(getJoiCustomDateTimeRule())

const field_exit = joi.string().custom(getJoiCustomDateTimeRule())

const field_is_present = joi.string().valid(...GuestStatus.values())


////////////////////////////////////////
///      Validate Create Guest      ///
///////////////////////////////////////

const schemaAddGuest = joi.object({
    firstname: field_firstname.required(),

    lastname: field_lastname.required(),

    sex: field_sex.required(),

    age: field_age.required(),

    enter: field_enter,

    exit: field_exit,

    is_present: field_is_present.default(GuestStatus.NOTSET)
})

const validateAddGuestBody = async ( body ) => {
    
    try {
        const value = await schemaAddGuest.validateAsync( body, { abortEarly: false })

        logger.info('add guest body validated successfully')
        logger.debug('add guest valid value ', { debugExtras: value })

        return value
    }
    catch(err) {
        throw new InputValidationError(err)
    }
}

const mwAddGuestForEventValidateBody = async ( req, res, next ) => {

    const body = req.boy 

    if ( body === null || body === undefined ) {
        return res.status(400).json({ code: 400, message: 'empty body'})
    }

    try {
        const value = validateAddGuestBody(body)

        req.validBody = { guest: value }

        next()
    }
    catch(err) {
        logger.error('mwAddGuestForEventValidateBody() encountered an error; ', err)

        if (err instanceof InputValidationError) {
            return res.status(400).json({ code: 400, message: err.message })
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error' })
        }
    }
}

////////////////////////////////////////
///      Validate Update Guest      ///
///////////////////////////////////////

const schemaUpdateGuest = joi.object({

    firstname: field_firstname,

    lastname: field_lastname,

    sex: field_sex,

    age: field_age,

    enter: field_enter,

    exit: field_exit,

    is_present: field_is_present
})

const validateUpdateGuestBody = async ( body ) => {

    try {
        const value = schemaUpdateGuest.validate(body, { abortEarly: false })

        return value
    }
    catch(err) {
        throw new InputValidationError(err)
    }
}

const mwUpdateGuestValidateBody = async (req, res, next ) => {

    logger.info('will validate update guest body')
    logger.debug('validate body for update guest ', body)

    try {
        const value = validateUpdateGuestBody()

        logger.info('update guest body validate successfully')
        logger.debug('update guest valid value ', value)

        req.validBody = value

        next()
    }
    catch(err) {
        logger.error('mwUpdateGuestValidateBody() encountered an error; ', err)

        if (err instanceof InputValidationError) {
            return res.status(400).json({ code: 400, message: err.message })
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error' })
        }
    }
}


module.exports = {
    validateAddGuestBody, validateUpdateGuestBody,

    mwAddGuestForEventValidateBody, mwUpdateGuestValidateBody
}