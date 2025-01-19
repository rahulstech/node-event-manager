const { Router } = require('express')
const { eventRoutes } = require('../routes/EventRoutes.js')
const { guestRoutes } = require('../routes/GuestRoutes.js')
const loggers = require('../utils/loggers.js') 

const logger = loggers.logger.child({ 
    module: 'ApiEndPoint',
})

const apiRoutes = Router()

// v1 routes

const v1 = Router()

v1.use('/v1', eventRoutes.api.v1)
v1.use('/v1', guestRoutes.api.v1)

apiRoutes.use('/api', v1)

/** Error handling middleware */

// 404 Not Found

apiRoutes.all('*', (req, res) => {
    logger.info(`${req.method} ${req.url} Not Found`)
    res.status(404).json({
        code: 404,
        message: 'Not Found'
    })
})

// 500 Internal Server Error

apiRoutes.use((err, req, res, next) => {
    logger.error(err)
    res.status(500).json({
        code: 500,
        message: 'Internal Server Error'
    })
})

module.exports = { apiRoutes }

