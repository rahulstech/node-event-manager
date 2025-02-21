const multer = require('multer')

const { Router } = require('express')

const loggers = require('../utils/loggers')

const { mwCreateEventBodyValidator, mwUpdateEventBodyValidator, mwGetEventByIdValidator, mwFilterEventsValidator } 
        = require('../services/inputValidation/EventInputValidationService')

const { createEvent, 
    
        getAllEvents, filterEvents, getEventById ,

        updateEvent

     } = require('../controllers/api/EventController')



const { catchRequestHandlerAsync } = require('../utils/errors')


const logger = loggers.logger.child({ module: 'EventRoutes' })

// Routes

const router1 = Router();

router1.get('/events', catchRequestHandlerAsync(getAllEvents))

router1.get('/events/filter', catchRequestHandlerAsync(mwFilterEventsValidator), catchRequestHandlerAsync(filterEvents))

router1.get('/events/:eventId', catchRequestHandlerAsync(mwGetEventByIdValidator), catchRequestHandlerAsync(getEventById))

router1.post('/events', multer().none(), catchRequestHandlerAsync(mwCreateEventBodyValidator)  , catchRequestHandlerAsync(createEvent))

router1.put('/events/:eventId', multer().none(), catchRequestHandlerAsync(mwUpdateEventBodyValidator)  , catchRequestHandlerAsync(updateEvent))

module.exports.eventRoutes = {
        api: {
            v1: router1,
        }  
    }