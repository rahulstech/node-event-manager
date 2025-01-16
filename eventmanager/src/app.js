
const express = require('express')

const events_routes = require('./routes/events')

const guests_routes = require('./routes/guests')

const utils = require('./utils.js')

const loggers = require('./loggers.js') 


const logger = loggers.logger.child({ 
    module: 'EventManager',
})

const server = express()

// global middlewares

server.use((req, res, next) => {
    logger.info(`${req.method} ${req.url}`)
    next()
})

// Events related routers

server.get('/api/v1/events', events_routes.getAllEvents)

server.get('/api/v1/events/filter', events_routes.filterEvents)

server.get('/api/v1/events/:eventId', events_routes.getEventById)

server.post('/api/v1/events', events_routes.getCreateEventMiddleWares(), events_routes.createEvent)

server.put('/api/v1/events/:eventId', events_routes.getUpdateEventMiddleWares(), events_routes.updateEvent)

// Guests realted routers

server.get('/api/v1/events/:eventId/guests', guests_routes.getAllGuestsForEvent)

server.get('/api/v1/events/:eventId/guests/search', guests_routes.searchEventGuests)

server.post('/api/v1/events/:eventId/guests', guests_routes.getAddGuestMiddleWares(), guests_routes.addGuestForEvent)

server.put('/api/v1/guests/:guestId', guests_routes.getUpdateGuestMiddleWares(), guests_routes.updateGuest)

server.delete('/api/v1/guests/:guestId', guests_routes.removeGuest)

// TODO: implement 404 not found


server.listen(process.env.SERVER_PORT, () => logger.info(`server is listening on port ${process.env.SERVER_PORT}`))

