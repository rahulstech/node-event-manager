const { removeGuestImage } = require('../../services/fileService/GuestImageService')
const { AppError } = require('../../utils/errors')
const path = require('node:path')
const { existsSync } = require('node:fs')
const guestDataService = require('../../services/dataService/GuestDataService')
const { captureDBErrorAsync } = guestDataService
const loggers = require('../../utils/loggers')


const logger = loggers.logger.child({ module: 'GuestApiController'})

// Create Guest 

const addGuestForEvent = async (req, res) => {
    const { eventId } = req.validParams

    const { guestData } = req.validBody

    const newGuest = await captureDBErrorAsync( guestDataService.addGuest(eventId, guestData))

    res.status(200).json({ code: 200, message: 'guest added', data: newGuest })
}

// Read Guests

const getAllGuestsForEvent = async (req, res) => {
   
    const { eventId } = req.validParams

    const guests = await captureDBErrorAsync( guestDataService.getAllGuestsForEvent(eventId))

    res.status(200).json({ code: 200, message: 'successful', data: { guests }})
}

const searchEventGuests = async (req, res) => {
    
    const { k } = req.validQuery

    const { eventId } = req.validParams

    const guests = await captureDBErrorAsync( guestDataService.searchGuestForEvent(eventId, { k }))

    res.status(200).json({ code: 200, message: 'successful', data: { guests }})
}

const getGuestById = async (req, res) => {

    const { guestId } = req.validParams

    const guest = await captureDBErrorAsync( guestDataService.getGuestById(guestId))

    res.status(200).json({ code: 200, message: 'successful', data: guest})
}

// Update Guest

const updateGuest = async (req, res) => {
    
    const { guestId } = req.validParams

    const { guestData } = req.validBody

    const { oldGuest, updatedGuest } = await captureDBErrorAsync( guestDataService.setGuest(guestId, guestData))

    removeGuestImage(oldGuest.guest_image )

    res.status(200).json({ code: 200, message: 'guest updated', data: updatedGuest })
}

// Delete Guest

const removeGuest = async (req, res) => {

    const { guestId } = req.validParams

    const guest = await captureDBErrorAsync(guestDataService.removeGuest(guestId))

    removeGuestImage(guest.guest_image)
    
    res.status(200).json({ code: 200, message: 'guest removed'})
}

// Guest Image

const getGuestImage = async ( req, res) => {

    const { guestImage } = req.params

    try {
        const guest_image_path = path.resolve(process.env.GUESTS_IMAGE_STORE, guestImage)
        if (existsSync(guest_image_path)){ 
            res.status(200).sendFile(guest_image_path)
        }
        else {
            throw new AppError(`guest image file "${guestImage}" not found`, 404)
        }
    }
    catch (err) {
        throw new AppError(err.message, 500, false, err.stack)
    }
}

module.exports = {
    addGuestForEvent, getAllGuestsForEvent, searchEventGuests, getGuestById, updateGuest, removeGuest, getGuestImage,
}