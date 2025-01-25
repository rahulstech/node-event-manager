const express = require('express')

const loggers = require('./utils/loggers.js') 

const { apiRoutes } = require('./routes/ApiRouter.js')

const { guestRoutes } = require('./routes/GuestRoutes.js')

const errors = require('./utils/errors.js')

const { connectDatabase }= require('./database/eventsdb')

const logger = loggers.logger.child({ 
    module: 'EventManager',
})

const server = express()
exports.server = server

// global middlewares

server.use((req, res, next) => {
    logger.info(`${req.method} ${req.url}`)
    next()
})

// routes

server.use('/', guestRoutes.guestImages)

server.use('/', apiRoutes)



connectDatabase().then(() => {

    server.listen(process.env.SERVER_PORT, () => logger.info(`server is listening on port ${process.env.SERVER_PORT}`))
})

