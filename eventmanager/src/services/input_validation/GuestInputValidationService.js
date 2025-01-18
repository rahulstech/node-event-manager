const joi = require('joi')
const { Sex, GuestStatus } = require('../../database/eventsdb')
const loggers = require('../../utils/loggers')
const { InputValidationError, getJoiCustomDateTimeRule } = require('./inputvalidator')
const { pushValidBody } = require('../../utils/helpers')

const logger = loggers.logger.child({ module: 'GuestInputValidationService' })



const field_firstname = joi.string()

const field_lastname = joi.string()

const field_sex = joi.string().valid(...Sex.values())

const field_age = joi.number().min(0) // TODO: should change min age ?

const field_enter = joi.string().custom(getJoiCustomDateTimeRule())

const field_exit = joi.string().custom(getJoiCustomDateTimeRule())
                        
const field_is_present = joi.string().valid(...GuestStatus.values())

const field_guest_image_path = joi.string() // TODO: validate file path

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

    is_present: field_is_present.default(GuestStatus.NOTSET),

    guest_image_path: field_guest_image_path.required()

})

const validateAddGuestBody = async ( body, file ) => {
    
    try {
        const data = { ...body, guest_image_path: file.path }
        const value = await schemaAddGuest.validateAsync( data, { abortEarly: false, allowUnknown: false })

        logger.info('add guest body validated successfully')
        logger.debug('add guest valid value ', { debugExtras: value })

        return value
    }
    catch(err) {
        throw new InputValidationError(err)
    }
}

const mwAddGuestForEventValidateBody = async ( req, res, next ) => {

    const { eventId } = req.validParams

    const body = req.body 

    const file = req.file

    logger.info(`will validate body for add guest for event ${eventId}`)
    logger.debug(`validate body `, { debugExtras: { eventId, body, file } })

    if ( !body ) {
        return res.status(400).json({ code: 400, message: 'empty body'})
    }

    if ( !file ) {
        return res.status(400).json({ code: 400, message: 'no guest image'})
    }

    try {
        const guestData = await validateAddGuestBody(body, file)

        pushValidBody(req, { guestData })

        logger.info(`validate add guest for event ${eventId} pushed valid guest`)
        logger.debug('valid guest ', { debugExtras: guestData })

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

    is_present: field_is_present,

    guest_image_path: field_guest_image_path
})

const validateUpdateGuestBody = async ( body, file ) => {

    try {
        const { path } = file || {}

        const data  = { ...body,  guest_image_path: path }

        const value = await schemaUpdateGuest.validateAsync(data, { abortEarly: false, allowUnknown: false })

        logger.info('update guest body validated successfully')
        logger.debug('update guest valid value ', { debugExtras: value })

        return value
    }
    catch(err) {
        throw new InputValidationError(err)
    }
}

const mwUpdateGuestValidateBody = async (req, res, next ) => {

    const { eventId } = req.validParams

    const body = req.body

    const file = req.file

    if (!body) {
        return res.status(400).json({ code: 400, message: 'empty body' })
    }

    logger.info('will validate update guest body')
    logger.debug('validate body for update guest ', { debugExtras: { eventId, body, file }})

    try {
        const value = await validateUpdateGuestBody(body, file)

        logger.info('update guest body validate successfully')
        logger.debug('update guest valid value ', value)

        pushValidBody(req, { guestData: value })

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