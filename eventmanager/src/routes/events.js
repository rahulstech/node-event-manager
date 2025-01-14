const { errorcodes, EventDB, EventDBError } = require('../database/eventsdb')
const multer = require('multer')
const utils = require('../utils')

const eventdb = EventDB.create()

const getAllEvents = (req, res) => {
    const events = eventdb.getAllEvents()
    res.status(200).json({
        code: 200,
        message: "successful",
        data: events
    })
}

const getEventById = (req, res) => {
    const { eventId } = req.params

    const _id = Number(eventId)
    const event = eventdb.getEventById(_id)
    if (null == event) {
        res.status(404).json({
            code: 404,
            message: `no event found with id ${eventId}`
        })
    }
    else {
        res.status(200).json({
            code: 200,
            message: "successful",
            data: event
        })
    }
}

const filterEvents = (req, res) => {
    const { k, status, venu, organizer } = req.query

    console.log('filterEvent query ', req.query)

    try {
        const events = eventdb.filterEvents(k, status, venu, organizer)
        res.status(200).json({ code: 200, message: 'successful', data: events})
    }
    catch(err) {
        console.log('filter events by ', req.query, ' failed with error ', err)
        return res.status(500).json({ code: 500, message: 'inter server error'})
    }
}

// create

const getCreateEventMiddleWares = () => {
    return multer().none()
}

const createEvent = (req, res) => {

    // step1: invalidate inputs: all the title, organizer, venu, description, start, end must be set.
    //        check start and end is a valid date time string in format yyyy-MM-dd HH:mm
    //        if status not set then set default status to "PENDING"
    console.log('createEvent request received ', req.body)

    const { title, organizer, venu, description, start, end, status } = req.body

    if (!title || !organizer || !venu || !description || !start || !end) {
        console.log('some inputs are missing or invalid')

        return res.status(400).json({ code: 400, message: 'invalid input'})
    }

    let startDateTime, endDateTime

    try {
        startDateTime = utils.parseDateTime(start)
    }
    catch(err) {
        console.log(`parse datetime '${start}' failed with error`, err)
        return res.status(400).json({ code: 400, message: `invalid start datetime '${start}''`})
    }

    try {
        endDateTime = utils.parseDateTime(end)
    }
    catch(err) {
        console.log(`parse datetime '${end}' failed with error`, err)
        return res.status(400).json({ code: 400, message: `invalid end datetime '${end}'`})
    }

    const eventCurrentStatus = !status ? "PENDING" : status

    // step2: add the event to database
    try {
        const newEvent = eventdb.createEvent({ title, organizer, venu, description, start: startDateTime, end: endDateTime, status: eventCurrentStatus })
        console.log('new event saved successfully')

        // step3: send the response
        return res.status(200).json({ code: 200, message: "event saved", data: newEvent })
    }
    catch(err) {
        if (err instanceof EventDBError) {
            console.log('can not save new event', err)
        }
        else {
            console.log('error occurred while saving new event', err)
        }
        return res.status(500).json({ code: 500, message: "not saved"})
    }
}

// update

const getUpdateEventMiddleWares = () => {
    return multer().none()
}

const updateEvent = (req, res) => {
    const { eventId } = req.params
    const { title, organizer, venu, description, start, end, status } = req.body

    console.log(`updateEvnt: eventId=${eventId} with body `, req.body)

    const _id = Number(eventId)

    let startDatetime = null
    let endDatetime = null
    if (start) {
        try {
            startDatetime = utils.parseDateTime(start)
        }
        catch(err) {
            console.log(`parse datetime '${start}' failed with error`, err)
            return res.status(400).json({ code: 400, message: `invalid end datetime '${start}'`})
        }
    }
    if (end) {
        try {
            endDatetime = utils.parseDateTime(end)
        }
        catch(err) {
            console.log(`parse datetime '${end}' failed with error`, err)
            return res.status(4000).json({ code: 400, message: `invalid end datetime '${end}'`})
        }
    }

    try {
        const event = eventdb.updateEvent(_id, 
            { title, organizer, venu, description, 
            start: startDatetime, end: endDatetime, status })
            
        res.status(200).json({ code: 200, message: 'successful', data: event })
    }
    catch(err) {
        console.log(`updateEvent eventId=${eventId} failed with error`,err)
        if (err instanceof EventDBError && err.code == errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}` })
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server srror' })
        }
    }
}

module.exports = {
    getAllEvents, getEventById, filterEvents, 
    getCreateEventMiddleWares, createEvent, 
    getUpdateEventMiddleWares, updateEvent
}