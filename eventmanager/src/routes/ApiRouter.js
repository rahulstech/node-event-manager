const { Router } = require('express')

const { eventRoutes } = require('./EventRoutes.js')

const { guestRoutes } = require('./GuestRoutes.js')

const { AppError } = require('../utils/errors.js')

const loggers = require('../utils/loggers.js') 



const logger = loggers.logger.child({ 
    module: 'ApiRouter',
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
    throw new AppError(`${req.method} ${req.url} Not Found`, 404)
})

// 500 Internal Server Error

apiRoutes.use((err, req, res, next) => {

    logger.error(err)

    if (err instanceof AppError) {
        const { statusCode, message } = err
        if (statusCode !== 500) {
            return res.status(err.statusCode).json({ code: statusCode, message })
        }    
    }

    res.status(500).json({ code: 500, message: 'internal server error' })
})

module.exports = { apiRoutes }

