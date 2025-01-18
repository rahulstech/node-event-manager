const { EventStatus } = require('../database/eventsdb.js')

const { isDateTimeBetween, formatDateTime, isDateTimeAfter } = require('../utils/helpers.js')

const multer = require('multer')

const loggers = require('../utils/loggers.js')

const { mwAddGuestForEventValidateBody, mwUpdateGuestValidateBody } = require('../services/input_validation/GuestInputValidationService.js')

const { mwGetEventById } = require('../services/data_service/EventDataService.js')

const { mwGetAllGuestsForEvent, mwSearchGuestsForEvent, mwGetGuestById, mwAddGuest, mwRemoveGuest }
                        = require('../services/data_service/GuestDataService.js')

const logger = loggers.logger.child({ module: 'GuestRoutes'})

const multipart = multer({ dest: process.env.GUESTS_IMAGE_STORE })

// Create Guest 

const mwCheckConsistentGuestDataForAdd = (req, res, next) => {

    const { event, guestData } = req.validBody
    const { id, start, end, status } = event
    const { enter, exit, is_present } =  guestData // TODO: enter exit may be undefined or null

    if (status === EventStatus.CANCELED || status === EventStatus.FINISHED) {
        logger.warn(`can not update guest for event with status ${EventStatus.CANCELED} or ${EventStatus.FINISHED}`)
        logger.debug(`event id ${id} status ${start}`)

        return res.status(422).json({ code: 422, messag: `event ${status}; can not update guest` })
    }

    // if (start && end) {

    //     if (!isDateTimeBetween(enter, start, end) || !isDateTimeBetween(exit, start, end, true)) {
    //         logger.warn('guest enter and/or exit is not between event start  and end time; can not update guest')
    
    //         logger.debug(`guest enter ${formatDateTime(enter)} exit ${formatDateTime(exit)} ` + 
    //         ` event start ${formatDateTime(start)} and end ${formatDateTime(end)}`)
    
    //         return res.status(422).json({ code: 422, message: 'enter and/or exit date time exceeds event start and end date time' })
    //     }
    
    //     if (enter && exit && !isDateTimeAfter(exit, enter, true)) {
    //         logger.warn('guest exit is not after enter')
    
    //         logger.debug(`enter ${enter} exit ${exit}`)
            
    //         return res.status(422).json({ code: 422, message: 'exit must be after enter'})
    //     }

    // }
        
    next()
}

const getAddGuestMiddleWares = () => {
    return [
        multipart.single('guest_image'), // extract body

        mwGetEventById,

        mwAddGuestForEventValidateBody, // validate body

        // mwCheckConsistentGuestDataForAdd, 

        mwAddGuest
    ]
}

const addGuestForEvent = async (req, res) => {
    const { newGuest } = req.validBody

    logger.debug('new guest', { debugExtras: newGuest })

    res.status(200).json({ code: 200, message: 'guest added', data: newGuest })
}

// Read Guests

const getAllGuestsForEventMiddleWares = () => {
    return [ 
        mwGetEventById, 
        mwGetAllGuestsForEvent 
    ]
}

const getAllGuestsForEvent = (req, res) => {
   
    const { event, guests } = req.validBody

    res.status(200).json({ code: 200, message: 'successful', data: { event, guests }})
}

const getSearchGuestsForEventMiddleWares = () => {
    return [ 
        mwGetEventById, 
        mwSearchGuestsForEvent 
    ]
}

const searchEventGuests = (req, res) => {
    const { event, guests } = req.validBody

    res.status(200).json({ code: 200, message: 'successful', data: { event, guests }})
}

// Update Guest

const mwCheckConsistentGuestDataForUpdate = (req, res, next) => {

    const { event, guestData } = req.validBody
    const { id, start, end, status } = event
    const { enter, exit, is_present } =  guestData

    if (status === EventStatus.CANCELED || status === EventStatus.FINISHED) {
        logger.warn('can not update guest for event with status ${EventStatus.CANCELED} or ${EventStatus.FINISHED}')
        logger.debug(`event id ${id} status ${start}`)

        return res.status(422).json({ code: 422, messag: `event ${status}; can not updated guest` })
    }
    if (!isDateTimeBetween(enter, start, end) || !isDateTimeBetween(exit, start, end, true)) {
        logger.warn('guest enter and/or exit is not between event start  and end time; can not update guest')

        logger.debug(`guest enter ${formatDateTime(enter)} exit ${formatDateTime(exit)} ` + 
        ` event start ${formatDateTime(start)} and end ${formatDateTime(end)}`)

        return res.status(422).json({ code: 422, message: 'enter and/or exit date time exceeds event start and end date time' })
    }
    if (enter && exit && !isDateTimeAfter(exit, enter, true)) {
        logger.warn('guest exit is not after enter')

        logger.debug(`enter ${enter} exit ${exit}`)
        
        return res.status(422).json({ code: 422, message: 'exit must be after enter'})
    }
    next()
}

const getUpdateGuestMiddleWares = () => {
    return [
        multipart.single('guest_image'), // extract body

        mwGetGuestById, // check and get guest

        mwGetEventById, // get event

        mwUpdateGuestValidateBody, // validate body

        mwCheckConsistentGuestDataForUpdate, // 
    ]
}

const updateGuest = (req, res) => {
    // TOOD: remove old guest image

    const { updatedGuest } = req.validBody

    res.status(200).json({ code: 200, message: 'guest updated', data: updatedGuest })
}

// Delete Guest

const getRemoveGuestMiddleWares = () => {
    return [
        mwGetGuestById,
        mwRemoveGuest
    ]
}

const removeGuest = async (req, res) => {
    // TODO: remove the guest image
    res.status(204).json({ code: 204, message: 'guest removed'})
}

module.exports = {
    getAllGuestsForEventMiddleWares, getAllGuestsForEvent,
    getSearchGuestsForEventMiddleWares, searchEventGuests, 
    getAddGuestMiddleWares, addGuestForEvent,
    getUpdateGuestMiddleWares , updateGuest,
    getRemoveGuestMiddleWares, removeGuest
}