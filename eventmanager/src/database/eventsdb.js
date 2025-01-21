
const { readFile, writeFile } = require('node:fs/promises')
const { existsSync } = require('node:fs')
const path = require('node:path')
const loggers = require('../utils/loggers')
const { AppError } = require('../utils/errors')

const FILE_NAME = 'events.json'

const IN_MEMORY = ':memory:' // for testing

const logger = loggers.logger.child({ module: 'EventsDB' })

const enumValues = ( enumClass ) => {
    return Object.values(enumClass)
            .filter( value => typeof value === 'string' )
}

const errorcodes = {
    READ_ERROR: 'READ ERROR',
    WRITE_ERROR: 'WRITE ERROR',
    NOT_FOUND: 'NOT FOUND',
}

class EventDBError extends AppError {

    constructor(message='', code=null) {
        super(message)
        this.code = code
        this.isOperational = true
        switch(code) {
            case errorcodes.NOT_FOUND: this.statusCode = 404
            break

            case errorcodes.READ_ERROR:
            case errorcodes.WRITE_ERROR: {
                this.statusCode = 500
                this.isOperational = false
            }
            break

            default: this.statusCode = 500; break
        }
    }
}

const EventStatus = {

    PENDING: 'PENDING', RUNNING: 'RUNNING', CANCELED: 'CANCELED', FINISHED: 'FINISHED',

    values: () => enumValues(EventStatus)
}

const Sex = {

    MALE: 'MALE', FEMALE: 'FEMALE', OTHER: 'OTHER',

    values: () => enumValues(Sex)
}

const GuestStatus = {

    NOTSET: 'NOTSET', PRESENT: 'PRESENT', ABSENT: 'ABSENT',

    values: () => enumValues(GuestStatus)
}

class EventDB {

    static instance = null

    static create() {
        if (EventDB.instance == null) {
            (async () => {
                const filepath = path.resolve(process.env.DATA_STORE, FILE_NAME)
                const db = new EventDB(filepath)
                db.initialize()
                EventDB.instance = db
            })()
        }
        return EventDB.instance
    }

    static createTest({ events, eventCounter, guests, guestCounter }) {
        if (EventDB.instance == null) {
            const db = new EventDB(IN_MEMORY)
                
            db.events = events ? new Map(events.map( e => [e.id, e])) : new Map()
            db.eventCounter = eventCounter
            db.guests = guests ? new Map(guests.map( g => [g.id, g])) : new Map()
            db.guestCounter = guestCounter

            EventDB.instance = db
        }
        return EventDB.instance
    }

    constructor(filepath) {
        this.filepath = filepath
        this.events = new Map()
        this.eventCounter = 0
        this.guests = new Map()
        this.guestCounter = 0
    }

    async initialize() {
        if (this.__isInMemory()) {
            logger.info('initializing in-memory events database')
            return
        }

        logger.info('initializing events database')

        try {
            await this.__createDiretory()

            await this.__readFromFile()

            logger.info('completed reading events database')
        }
        catch(err) {
            logger.error(err)
            process.exit()
        }
    }

    __isInMemory() { return this.filepath === IN_MEMORY }

    async __createDiretory() {
        const dirname = path.dirname(this.filepath)

        if (!existsSync(dirname)) {
            logger.info(`creating data store directory ${dirname}`)

            await mkdir(DATA_STORE, { recursive: true })
        }
    }

    async __writeToFile() { 
        if (this.__isInMemory()) {
            return
        }

        const events = this.events
        const guests = this.guests
        const eventCounter = this.eventCounter
        const guestCounter = this.guestCounter
        const data = {
            eventCounter,
            guestCounter,
            events: [],
            guests: []
        }
        for (const [ id, event ] of events) {
            data.events.push(event)
        }
        for (const [ id, guest ] of guests) {
            data.guests.push(guest)
        }
        const json = JSON.stringify(data)
        
        await writeFile(this.filepath, json) // error for this not so clearly logged
    }

    async __readFromFile() {

        const data = await readFile(this.filepath, 'utf-8')
        if (!data) {
            logger.info('events database file is empty')
            return
        }
        const json = JSON.parse(data)
        const events = json.events
        const guests = json.guests
        for (const event of events) {
            this.events.set(event.id, event)
        }
        for (const guest of guests) {
            this.guests.set(guest.id, guest)
        }
        this.eventCounter = json.eventCounter
        this.guestCounter = json.guestCounter
     }

    // CRUD Methods For Event

    async createEvent(event) {
        const id = this.__generateEventId()
        const newEvent = { id, ...event}

        try {
            this.events.set(id, newEvent)

            await this.__writeToFile()

            logger.info('event saved successfully')

            return newEvent
        }
        catch(err) {
            this.events.delete(id)
            throw new EventDBError('error creating event', errorcodes.WRITE_ERROR)
        }
    }

    __generateEventId() { return ++this.eventCounter }

    __hasEvent(eventId) { return this.events.has(eventId) }

    getAllEvents() { 
        const eventsMap = this.events
        const events = []
        for (const [ id, event] of eventsMap) {
            events.push(event)
        }
        return events
    }

    filterEvents( keyword, status = null, venu = null, organizer = null ) {
        const events = this.getAllEvents()
        const result = events.filter( e => (!keyword || e.title.includes(keyword))
            && (!status || e.status === status)
            && (!organizer || e.organizer == organizer)
            && (!venu || e.venu === venu)
        )
        return result
    }

    getEventById(eventId) {
        const events = this.events
        if (!this.__hasEvent(eventId)) {
            throw new EventDBError(`event with id ${eventId} does not exists`, errorcodes.NOT_FOUND)
        }
        const event = events.get(eventId)
        return event
    }

    async updateEvent(eventId, input) {
        const events = this.events

        if (!this.__hasEvent(eventId)) {
            throw new EventDBError(`event with id ${eventId} does not exists`, errorcodes.NOT_FOUND)
        }

        const oldEvent = events.get(eventId)

        const event = { ...oldEvent, ...input }

        try {
            events.set(eventId, event)

            await this.__writeToFile()

            logger.info(`updated event with id ${eventId} saved successfully`)

            return event
        }
        catch(err) {
            events.set(eventId, oldEvent)

            throw new EventDBError('error updating event', errorcodes.WRITE_ERROR)
        }
    }

    // CRUD Methods For Guest

    async addGuestForEvent(eventId, input) {
        
        const id = this.__generateGuestId()
        const newGuest = { id, eventId, ...input }

        if (newGuest.is_present !== GuestStatus.PRESENT) {
            newGuest.enter = null
            newGuest.exit = null
        }

        try {
            this.guests.set(id, newGuest)

            await this.__writeToFile()

            logger.info(`add guest for event ${eventId} saved successfully`)
            logger.debug('saved guest ', { debugExtras: newGuest})

            return newGuest
        }
        catch(err) { 
            this.guests.delete(id)
            throw new EventDBError('error adding guest', errorcodes.WRITE_ERROR)
        }
    }

    __generateGuestId() { return ++this.guestCounter }

    __hasGuest(guestId) { return this.guests.has(guestId) }

    getAllGuestsForEvent(eventId) {
        const allGuests = this.guests

        const eventGuests = []

        for (const [ id, guest ] of allGuests) {
            if (guest.eventId === eventId) {
                eventGuests.push(guest)
            }
        }
        
        return eventGuests
    }

    getGuestById(guestId) {
        if (!this.__hasGuest(guestId)) {
            throw new EventDBError(`guest with id ${guestId} not found`, errorcodes.NOT_FOUND)
        }

        const guest = this.guests.get(guestId)
        
        return { ...guest }
    }

    filterGuestsForEvent(eventId, k) {
        const guests = this.getAllGuestsForEvent(eventId)

        const filtered = guests.filter( guest => guest.firstname.includes(k) || guest.lastname.includes(k ))

        return filtered
    }

    async updateGuest(guestId, input) {
        const guests = this.guests

        if (!this.__hasGuest(guestId)) {
            throw new EventDBError(`no guest found for id ${guestId}`, errorcodes.NOT_FOUND)
        }

        const oldGuest = guests.get(guestId)
        
        if (input.is_present !== GuestStatus.PRESENT) {
            input.enter = null
            input.exit = null
        }

        try {
            const guest = { ...oldGuest, ...input }

            guests.set(guestId, guest)

            await this.__writeToFile()

            logger.info(`updated guest with id ${guestId} saved succeessfully`)

            return guest
        }
        catch(err) {
            logger.error('updateGuest() encountered an error; ', err)

            guests.set(guestId, oldGuest)

            throw new EventDBError('error updating guest', errorcodes.WRITE_ERROR)
        }
    }

    async removeGuest(guestId) {
        const guests = this.guests

        const oldGuest = guests.get(guestId)

        try {
            guests.delete(guestId)

            await this.__writeToFile()
            
            logger.info(`guest removed from database`)

            return true
        }
        catch(err) {
            logger.error('removeGuest() encountered an error; ', err)

            guests.set(guestId, oldGuest)

            throw new EventDBError('error removing guest', errorcodes.WRITE_ERROR)
        }
    }
}

module.exports = { errorcodes, EventDB, EventDBError, EventStatus, Sex, GuestStatus }
