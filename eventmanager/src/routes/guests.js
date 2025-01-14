const { errorcodes, EventDB, EventDBError } = require('../database/eventsdb')
const utils = require('../utils')
const multer = require('multer')
const path = require('node:path')

const eventsdb = EventDB.create()

const multipart = multer({ dest: process.env.GUESTS_IMAGE_STORE })

// Create Guest 

const getAddGuestMiddleWares = () => {
    return multipart.single('guest_image')
}

const addGuestForEvent = (req, res) => {
    const { eventId } = req.params 
    const { firstname, lastname, age, sex, enter, exit, is_present } = req.body
    const guest_image = req.file

    console.log(`adding new guest for event ${eventId}; guest info `, req.body, ', guest_image = ', guest_image)

    if (!firstname || !lastname || !age || !sex ) {
        console.log('some of the inputs in addGuest are invaid')
        return res.status(400).json({ code: 400, message: 'invalid input(s)' })
    }

    let enterDatetime = null
    let exitDateTime = null
    if (enter) {
        try {
            enterDatetime = utils.parseDateTime(enter)
        }
        catch(err) {
            console.log(`parse enter datetime '${enter}' failed with error `, err)
            return res.status(400).json({ code: 400, message: `invalid enter date time '${enter}'; must be in format 'YYYY-MM-DD HH:MM'`})
        }
    }

    if (exit) {
        try {
            enterDatetime = utils.parseDateTime(exit)
        }
        catch(err) {
            console.log(`parse exit datetime '${exit}' failed with error `, err)
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
        const newGuest = eventsdb.addGuestForEvent(_eventId, guest)

        console.log(`new guest `, guest , ` for event ${eventId} saved successfully`)

        res.status(200).json({ code: 200, message: 'successful', data: newGuest })
    }
    catch(err) {
        console.log(`add guest failed with an error `, err)
        if (err instanceof EventDBError) {
            if (err.code === errorcodes.NOT_FOUND) {
                return res.status(404).json({ code: 404, message: `no event found with id ${eventId}`})
            }
            else {
                return res.status(500).json({ code: 500, message: `internal server error`})
            }
        }
        else {
            return res.status(500).json({ code: 500, message: `internal server error`})
        }
    }
}

// Read Guests

const getAllGuestsForEvent = (req, res) => {
    const { eventId } = req.params

    console.log(`get all guests for event with id ${eventId}`)

    try {
        const _eventId = Number(eventId)
        const event = eventsdb.getEventById(_eventId)
        const guests = eventsdb.getAllGuestsForEvent(_eventId)
        res.status(200).json({ code: 200, message: 'successful', data: { event, guests } })
    }
    catch (err) {
        console.log(`get all guests for event with id ${eventId} failed with error `, err)
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

    console.log(`search event guests for each with id ${eventId} and query `, req.query)

    try {
        const _eventId = Number(eventId)
        const guests = eventsdb.filterGuestsForEvent(_eventId, k)
        res.status(200).json({ code: 200, message: 'successful', data: guests })
    }
    catch (err) {
        console.log(`search guests for event with id ${eventId} failed with error `, err)
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
    
    console.log(`update guest with id ${guestId} and values `, req.body)

    const { firstname, lastname, age, sex, enter, exit, is_present } = req.body
    const guest_image = req.file

    let enterDatetime = null
    let exitDateTime = null

    if (enter) {
        try {
            enterDatetime = utils.parseDateTime(enter)
        }
        catch(err) {
            console.log(`parse enter date time '${enter}' failed with error `, err)
            return res.status(400).json({ code: 400, message: `invalid enter date time  '${enter}'; valid format 'YYYY-MM-DD HH:MM'`})
        }
    }
    
    if (exit) {
        try {
            exitDateTime = utils.parseDateTime(exit)
        }
        catch(err) {
            console.log(`parse enter date time '${exit}' failed with error `, err)
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
        console.log('updated guest ', guest)

        res.status(200).json({ code: 200, message: 'successful', data: guest })
    }
    catch(err) {
        console.log(`update guest with id ${guestId} failed with error `, err)
        if (err instanceof EventDBError && err.code == errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no guest found with id ${guestId}`})
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error'})
        }
    }
}

// Delete Guest

const removeGuest = (req, res) => {
    const { guestId } = req.params

    const _id = Number(guestId)
    console.log(`remove guest with id ${guestId}`)

    try {
        eventsdb.removeGuest(_id)
        res.status(200).json({ code: 200, message: 'successful' })
    }
    catch(err) {
        console.log(`remove guest with id ${guestId} failed with error `, err)
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