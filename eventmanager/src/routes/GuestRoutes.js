const { EventStatus } = require('../database/eventsdb.js')

const { isDateTimeBetween } = require('../utils/helpers.js')

const multer = require('multer')

const loggers = require('../utils/loggers.js')

const { mwAddGuestForEventValidateBody, mwUpdateGuestValidateBody } = require('../services/input_validation/GuestInputValidationService.js')

const { mwGetEventById } = require('../services/data_service/EventDataService.js')

const { mwGetAllGuestsForEvent, mwSearchGuestsForEvent, mwGetGuestById, mwAddGuest, mwRemoveGuest, mwUpdateGuest }
                        = require('../services/data_service/GuestDataService.js')

const { RouteError } = require('./RouteError.js')

const { rm } = require('node:fs/promises')

const { existsSync } = require('node:fs')

const path = require('node:path')

const logger = loggers.logger.child({ module: 'GuestRoutes'})

const multipart = multer({ dest: process.env.GUESTS_IMAGE_STORE })

const ensureConsistentGuestData = ( event, guestData ) => {

    const { start, end, status } = event
    const { enter, exit } =  guestData

    // if event is canceled or finished, update not allowed

    if (status === EventStatus.CANCELED || status === EventStatus.FINISHED) {
        logger.warn(`can not update guest for event with status ${EventStatus.CANCELED} or ${EventStatus.FINISHED}`)
        logger.debug(`event status ${status}`)

        throw new RouteError(`event status ${status}; can not modify guest`)
    }

    // check enter and exit is between event start and end

    let messages = []
    let inconsistent = false

    if (enter && !isDateTimeBetween(enter, start, end, true)) {
        const message = '\"enter\" must be between event start and end'

        messages.push(message)

        inconsistent = true
    }

    if (exit && !isDateTimeBetween(exit, start, end, true)) {
        const message = '"exit" must be between event start and end'

        messages.push(message)

        inconsistent = true
    }

    if (inconsistent) {
        logger.warn('inconsistent guest update data found', { debugExtras: messages })

        throw new RouteError(JSON.stringify(messages))
    }
}

const mwCheckConsistentGuestData = (req, res, next) => {

    const { event, guestData } = req.validBody
    
    try {
        ensureConsistentGuestData(event, guestData)
    }
    catch(err) {
        return res.status(422).json({ code: 422, message: err.message })
    }
    
    next()
}

// Create Guest 

const getAddGuestMiddleWares = () => {
    return [
        mwGetEventById, // check and get event

        multipart.single('guest_image'), // extract body

        mwAddGuestForEventValidateBody, // validate body

        mwCheckConsistentGuestData, // check consistency

        mwAddGuest, // add in database 
    ]
}

const addGuestForEvent = (req, res) => {
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


const mwDeleteGuestImageFileAfterUpdate = async (req, res, next) => {
    
    const { guest, updatedGuest } = req.validBody
    const { guest_image } = guest

    if (updatedGuest && updatedGuest.guest_image === guest_image) {
        // old guest image is not updated, don't delete it
        next()
        return
    }

    try {
        await rm(guest_image)
    }
    catch(err) {
        logger.warn('mwDeleteGuestImageFileAfterUpdate() encountered an error; ', err)
        logger.debug(`guest image ${guest_image}`)
    }

    next()
}

const getUpdateGuestMiddleWares = () => {
    return [
        mwGetGuestById, // check and get guest

        multipart.single('guest_image'), // extract body

        mwUpdateGuestValidateBody, // validate body

        mwGetEventById, // get event

        mwCheckConsistentGuestData, // check consistency

        mwUpdateGuest, // update in database

        mwDeleteGuestImageFileAfterUpdate, // delete the old guest image file
    ]
}

const updateGuest = (req, res) => {
    
    const { updatedGuest } = req.validBody

    res.status(200).json({ code: 200, message: 'guest updated', data: updatedGuest })
}

// Delete Guest

const mwDeleteGuestImageFileAfterRemove = async (req, res, next) => {
    
    const { removedGuest } = req.validBody
    const { guest_image } = removedGuest

    try {
        await rm(guest_image)
    }
    catch(err) {
        logger.warn('mwDeleteGuestImageFileAfterRemove() encountered an error; ', err)
        logger.debug(`guest image ${guest_image}`)
    }

    next()
}

const getRemoveGuestMiddleWares = () => {
    return [
        mwGetGuestById,

        mwRemoveGuest,

        mwDeleteGuestImageFileAfterRemove,
    ]
}

const removeGuest = (req, res) => {
    
    res.status(200).json({ code: 200, message: 'guest removed'})
}

// Guest Image

const getGuestImage = ( req, res) => {

    const { guestImage } = req.params

    try {
        const guest_image_path = path.resolve(process.env.GUESTS_IMAGE_STORE, guestImage)
        if (existsSync(guest_image_path)){ 
            res.status(200).sendFile(guest_image_path)
        }
        else {
            res.send(404).json({ code: 404, message: `not found`})
        }
    }
    catch (err) {
        logger.error('getGuestImage() encountered and error; ', err)

        res.send(500).json({ code: 500, message: 'internal server error'})
    }
}

module.exports = {
    ensureConsistentGuestData,
    getAllGuestsForEventMiddleWares, getAllGuestsForEvent,
    getSearchGuestsForEventMiddleWares, searchEventGuests, 
    getAddGuestMiddleWares, addGuestForEvent,
    getUpdateGuestMiddleWares , updateGuest,
    getRemoveGuestMiddleWares, removeGuest,
    getGuestImage
}