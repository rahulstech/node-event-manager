const eventsdb = require('../../src/database/eventsdb')

const event1 = {
    title: "my first event", organizer: "me", venu: "Berhampore", description: "this is organized by me",
    start: new Date(2023,4,15,14,30), end: new Date(2023,4,15,16,0), status: "CANCELED"
}

const event2 = {
    title: "annual general event", organizer: "organizer A", venu: "Kandi", description: "this is annual event of organizer A",
    start: new Date(2023,3,17,7,30), end: new Date(2023,3,17,9,30), status: "PENDING"
}

const event3 = {
    title: "quaterly general event", organizer: "organizer B", venu: "Salar", description: "this is quaterly event of organizer B",
    start: new Date(2023,3,31,12,0), end: new Date(2023,3,31,15,0), status: "PENDING"
}

const event4 = {
    title: "my second event", organizer: "me", venu: "Berhampore", description: "this is my second organized event",
    start: new Date(2023,7,15,14,0), end: new Date(2023,74,15,16,0), status: "PENDING"
}

let instance;

function setup() {
    instance = new eventsdb.EventDB()
    instance.events.set(1, { event: event1, guests: [] })
    instance.events.set(2, { event: event2, guests: [] })
    instance.events.set(3, { event: event3, guests: [] })
    instance.events.set(4, { event: event4, guests: [] })
}

function test_filterEvent() {
    const events = instance.filterEvents(null, "PENDING", null, "me")
    console.log(events)
}

setup()
test_filterEvent()