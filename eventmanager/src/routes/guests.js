const { errorcodes, EventDB, EventDBError } = require('../database/eventsdb')
const utils = require('../utils')
const multer = require('multer')
const loggers = require('../loggers.js')

const logger = loggers.logger.child({ module: 'GuestsRoutes'})

const eventsdb = EventDB.create()

const multipart = multer({ dest: process.env.GUESTS_IMAGE_STORE })

// Create Guest 

const getAddGuestMiddleWares = () => {
    return multipart.single('guest_image')
}

const addGuestForEvent = async (req, res) => {

    const { eventId } = req.params 

    logger.info(`called addGuestForEvent() with id ${eventId}`)
    logger.debug('addGuestForEvent() body = ', { debugExtras: { body: req.body, file: req.file }})

    const { firstname, lastname, age, sex, enter, exit, is_present } = req.body
    const guest_image = req.file

    if (!firstname || !lastname || !age || !sex ) {
        logger.debug('some of the inputs in addGuestForEvent() are invalid')
        return res.status(400).json({ code: 400, message: 'invalid input(s)' })
    }

    let enterDatetime = null
    let exitDateTime = null
    if (enter) {
        try {
            enterDatetime = utils.parseDateTime(enter)
        }
        catch(err) {
            logger.error(err)
            return res.status(400).json({ code: 400, message: `invalid enter date time '${enter}'; must be in format 'YYYY-MM-DD HH:MM'`})
        }
    }

    if (exit) {
        try {
            enterDatetime = utils.parseDateTime(exit)
        }
        catch(err) {
            logger.error(err)
            return res.status(400).json({ code: 400, message: `invalid exit date time '${exit}'; must be in format 'YYYY-MM-DD HH:MM'`})
        }
    }

    let isPresent = 'NOTSET'
    if (is_present && !['ABSENT', 'PRESENT','NOTSET'].includes(is_present)) {
        isPresent = 'NOTSET'
    }

    try {
        const _eventId = Number(eventId)
        const guest = { firstname, lastname, age, sex, guest_image_path: guest_image.path,
            enter: enterDatetime, exit: exitDateTime, is_present: isPresent}

        const newGuest = await eventsdb.addGuestForEvent(_eventId, guest)

        logger.info(`new guest for evnt ${eventId} saved successfully`)
        logger.debug(`new guest = `, { debugExtras: newGuest })

        res.status(200).json({ code: 200, message: 'guest added', data: newGuest })
    }
    catch(err) {
        logger.error(err)
        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}`})
        }
        else {
            return res.status(500).json({ code: 500, message: `internal server error`})
        }
    }
}

// Read Guests

const getAllGuestsForEvent = (req, res) => {
    const { eventId } = req.params

    logger.info(`called getAllGuestsForEvent() with event id ${eventId}`)

    try {
        const _eventId = Number(eventId)
        const event = eventsdb.getEventById(_eventId)
        const guests = eventsdb.getAllGuestsForEvent(_eventId)

        logger.info(`got all guests for event '${eventId}'`)
        logger.debug(`event and guests for eventId ${eventId} = `, { debugExtras: { event, guests }})

        res.status(200).json({ code: 200, message: 'successful', data: { event, guests } })
    }
    catch (err) {
        logger.error(err)
        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}`})
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error'})
        }
    }
}

const searchEventGuests = (req, res) => {
    const { eventId } = req.params
    const { k } = req.query

    logger.info(`called searchEventGuests() with event id ${eventId}`)
    logger.debug(`search event '${eventId}' guests with query = `, { debugExtras: req.query })

    try {
        const _eventId = Number(eventId)
        const guests = eventsdb.filterGuestsForEvent(_eventId, k)

        logger.info(`search guests for event with id ${eventId} successful`)
        logger.debug(`guests = `, { debugExtras: guests })

        res.status(200).json({ code: 200, message: 'successful', data: guests })
    }
    catch (err) {
        logger.error(err)
        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}`})
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error'})
        }
    }
}

// Update Guest

const getUpdateGuestMiddleWares = () => {
    return multipart.single('guest_image')
}

const updateGuest = (req, res) => {
    const { guestId } = req.params

    logger.info(`called updateGuest() with id ${guestId}`)
    logger.debug(`updateGuest() body = `, { debugExtras: { body: req.body, file: req.file }})

    const { firstname, lastname, age, sex, enter, exit, is_present } = req.body
    const guest_image = req.file

    let enterDatetime = null
    let exitDateTime = null

    if (enter) {
        try {
            enterDatetime = utils.parseDateTime(enter)
        }
        catch(err) {
            logger.error(err)
            return res.status(400).json({ code: 400, message: `invalid enter date time  '${enter}'; valid format 'YYYY-MM-DD HH:MM'`})
        }
    }
    
    if (exit) {
        try {
            exitDateTime = utils.parseDateTime(exit)
        }
        catch(err) {
            logger.error(err)
            return res.status(400).json({ code: 400, message: `invalid enter date time  '${exit}'; valid format 'YYYY-MM-DD HH:MM'`})
        }
    }

    let isPresent = null
    if (is_present && ['ABSENT', 'PRESENT', 'NOTSET'].includes(is_present)) {
        isPresent = is_present
    }

    try {
        const input = { firstname, lastname, age, sex, guest_image_path: guest_image ? guest_image.path : null,
            enter: enterDatetime, exit: exitDateTime, is_present: isPresent }
        const _guestId = Number(guestId)
        const guest = eventsdb.updateGuest(_guestId, input)

        logger.info(`guest with id ${guestId} updated successfully`)
        logger.debug(`updated guest = `, { debugExtras: guest })

        res.status(200).json({ code: 200, message: 'guest updated', data: guest })
    }
    catch(err) {
        logger.error(err)
        if (err instanceof EventDBError && err.code == errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no guest found with id ${guestId}`})
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error'})
        }
    }
}

// Delete Guest

const removeGuest = async (req, res) => {
    const { guestId } = req.params

    logger.info(`called removeGuest() with id ${guestId}`)

    const _id = Number(guestId)

    try {
        await eventsdb.removeGuest(_id)

        logger.info(`guest with id ${guestId} removed successfully`)

        res.status(200).json({ code: 200, message: 'guest removed' })
    }
    catch(err) {
        logger.error(err)
        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no guest found with id ${guestId}`})
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error'})
        }
    }
}

module.exports = {
    getAllGuestsForEvent, searchEventGuests, 
    getAddGuestMiddleWares, addGuestForEvent,
    getUpdateGuestMiddleWares , updateGuest,
    removeGuest
}