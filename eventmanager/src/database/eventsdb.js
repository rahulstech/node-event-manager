
const errorcodes = {
    NOT_FOUND: 0,
}

class EventDBError extends Error {

    constructor(message='', code=null) {
        super(message)
        this.code = code
    }
}

class EventDB {

    static instance = null

    static create() {
        if (EventDB.instance == null) {
            EventDB.instance = new EventDB()
        }
        return EventDB.instance
    }

    constructor() {
        this.events = new Map()
        this.eventCounter = 0
        this.guests = new Map()
        this.guestCounter = 0
    }

    // CRUD Methods For Event

    createEvent(event) {
        const id = this.__generateEventId()
        const newEvent = { id, ...event}
        this.events.set(id, newEvent)
        return newEvent
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
        if (this.__hasEvent(eventId)) {
            const event = events.get(eventId)
            return event
        }
        return null
    }

    updateEvent(eventId, input) {
        const events = this.events
        if (!this.__hasEvent(eventId)) {
            throw new EventDBError(`event with id ${eventId} does not exists`, errorcodes.NOT_FOUND)
        }
        const event = events.get(eventId)

        const { title, organizer, venu, description, start, end, status } = input

        if (title) {
            event.title = title
        }
        if (organizer) {
            event.organizer = organizer
        }
        if (venu) {
            event.venu = venu
        }
        if (description) {
            event.description = input.description
        }
        if (status) {
            event.status = status
        }
        if (start) {
            event.start = start
        }
        if (end) {
            event.end = end
        }

        this.events.set(eventId, event)
        
        return event
    }

    // CRUD Methods For Guest

    addGuestForEvent(eventId, input) {
        if (!this.__hasEvent(eventId)) {
            throw new EventDBError(`can not add guest to event ${eventId}; event does not exists`, errorcodes.NOT_FOUND)
        }

        const id = this.__generateGuestId()
        const newGuest = { id, eventId, ...input }

        this.guests.set(id, newGuest)

        return newGuest
    }

    __generateGuestId() { return ++this.guestCounter }

    __hasGuest(guestId) { return this.guests.has(guestId) }

    getAllGuestsForEvent(eventId) {
        if (!this.__hasEvent(eventId)) {
            throw new EventDBError(`event with id ${eventId} not found`, errorcodes.NOT_FOUND)
        }
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
            return null
        }
        return this.guests.get(guestId)
    }

    filterGuestsForEvent(eventId, k) {
        const guests = this.getAllGuestsForEvent(eventId)
        const filtered = guests.filter( guest => guest.firstname.includes(k) || guest.lastname.includes(k ))
        return filtered
    }

    updateGuest(guestId, input) {
        const guests = this.guests
        if (!this.__hasGuest(guestId)) {
            throw new EventDBError(`guest with id ${guestId} not found`)
        }
        const oldguest = guests.get(guestId)
        const guest = { ...oldguest }
        const { firstname, lastname, age, sex, guest_image_path, enter, exit, is_present } = input

        if (firstname) {
            guest.firstname = firstname
        }
        if (lastname) {
            guest.lastname = lastname
        }
        if (age) {
            guest.age = age
        }
        if (sex) {
            guest.sex = sex
        }
        if (enter) {
            guest.enter = enter
        }
        if (exit) {
            guest.exit = exit
        }
        if (is_present) {
            guest.is_present = is_present
        }
        if (guest_image_path) {
            guest.guest_image_path = guest_image_path
        }

        guests.set(guestId, guest)

        return guest
    }

    removeGuest(guestId) {
        const allguests = this.guests
        if (!this.__hasGuest(guestId)) {
            throw new EventDBError(`guest with id ${guestId} not found`, errorcodes.NOT_FOUND)
        }

        const guest = allguests.get(guestId)
        allguests.delete(guestId)
        
        return true
    }
}

module.exports = { errorcodes, EventDB, EventDBError }
