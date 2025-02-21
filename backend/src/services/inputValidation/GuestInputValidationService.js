const joi = require('joi')

const { Sex, GuestStatus } = require('../../database/eventsdb')

const loggers = require('../../utils/loggers')

const { InputValidationError, getJoiCustomDateTimeRule, validate } = require('./inputvalidator')

const { pushValidBody, isDateTimeAfter, pushValidParams, pushValidQuery } = require('../../utils/helpers')
const { mwFilterEventsValidator } = require('./EventInputValidationService')




const logger = loggers.logger.child({ module: 'GuestInputValidationService' })



const field_firstname = joi.string()

const field_lastname = joi.string()

const field_sex = joi.string().valid(...Sex.values())

const field_age = joi.number().min(0) // TODO: should change min age ?

const field_enter = joi.custom(getJoiCustomDateTimeRule())

const field_exit = joi.custom(getJoiCustomDateTimeRule())
                        
const field_is_present = joi.string().valid(...GuestStatus.values())

const field_guest_image = joi.string() // TODO: validate file path

const field_guestId = joi.number().integer().required()

const field_eventId = joi.number().integer().required()


////////////////////////////////////////
///      Validate Create Guest      ///
///////////////////////////////////////

const schemaAddGuest = joi.object({

    params: joi.object({

        eventId: field_eventId,

    }).required(),

    body: joi.object({

        firstname: field_firstname.required(),

        lastname: field_lastname.required(),
    
        sex: field_sex.required(),
    
        age: field_age.required(),
    
        enter: field_enter,
    
        exit: field_exit,
    
        is_present: field_is_present.default(GuestStatus.NOTSET),

    }).required(),

    file: joi.object({

        filename: field_guest_image.required()

    }).required()
})

const mwAddGuestForEventValidateBody = async ( req, res, next ) => {

    const { params, body, file } = req

    const value = await validate( schemaAddGuest, { params, body, file })

    const { eventId } = value.params

    const guestData = { ...value.body, guest_image: value.file.filename }

    pushValidParams(req, { eventId })

    pushValidBody(req, { guestData })

    next()
}

////////////////////////////////////////
///      Validate Update Guest      ///
///////////////////////////////////////

const schemaUpdateGuest = joi.object({

    params: joi.object({

        guestId: field_guestId

    }).required(),

    body: joi.object({

        firstname: field_firstname,

        lastname: field_lastname,

        sex: field_sex,

        age: field_age,

        enter: field_enter,

        exit: field_exit,

        is_present: field_is_present,

    }).required(),

    file: joi.object({
        filename: field_guest_image
    }),
})

const mwUpdateGuestValidateBody = async (req, res, next ) => {

    const { params, body, file } = req

    const value = await validate(schemaUpdateGuest, { params, body, file })

    const { params: { guestId }, body: validBody, file: validFile } = value

    const guestData = { ...validBody }

    if (validFile && validFile.filename ) {
        guestData['guest_image'] = validFile.filename
    }
    
    pushValidParams(req, { guestId })

    pushValidBody(req, { guestData: guestData })

    next()
}

////////////////////////////////////////
///      Validate Get Guest         ///
///////////////////////////////////////

/** Get All Guests For Event */

const schemaGetAllGuestsForEvent = joi.object({

    params: joi.object({

        eventId: field_eventId,

    }).required(),
})

const mwGetAllGuestsForEventValidator = async (req, res, next) => {

    const { params } = req

    const value = await validate(schemaGetAllGuestsForEvent, { params })

    const { eventId } = value.params

    pushValidParams(req, { eventId })

    next()
}

/** Search Guests For Event */

const schemaSearchGuestsForEvent = joi.object({

    params: joi.object({

        eventId: field_eventId,

    }).required(),

    query: joi.object({

        k: joi.string().required()

    }).required()
})

const mwSearchGuestsForEventValidator = async (req, res, next) => {

    const { params, query } = req

    const value = await validate(schemaSearchGuestsForEvent, { params, query })

    const { eventId } = value.params

    const { k } = value.query

    pushValidParams(req, { eventId })
    pushValidQuery(req, { k })

    next()
}

const schemaGetGuestById = joi.object({

    params: joi.object({

        guestId: field_guestId,

    }).required(),
})

const mwGetGuestByIdValidator = async (req, res, next) => {

    const { params } = req

    const value = await validate(schemaGetGuestById, { params })

    const { guestId } = value.params

    pushValidParams(req, { guestId })

    next()
}

////////////////////////////////////////
///      Validate Remove Guest       ///
///////////////////////////////////////


const schemaRemoveGuest = joi.object({

    params: joi.object({

        guestId: field_guestId,

    }).required(),
})

const mwRemoveGuestValidator = async (req, res, next) => {

    const { params } = req

    const { params: { guestId }} = await validate(schemaRemoveGuest, { params })

    pushValidParams(req, { guestId })

    next()
}

module.exports = {
    mwAddGuestForEventValidateBody, mwGetAllGuestsForEventValidator, mwSearchGuestsForEventValidator,
    mwGetGuestByIdValidator, mwUpdateGuestValidateBody, mwRemoveGuestValidator,
}