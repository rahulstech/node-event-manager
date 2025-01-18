const  { errorcodes, EventDB, EventDBError } = require('../../database/eventsdb')
const joi = require('joi')
const loggers = require('../../utils/loggers')
const { pushValidBody, pushValidParams } = require('../../utils/helpers')

const logger = loggers.logger.child({ module: 'EventDataServie' })

const eventsdb = EventDB.create()

const schemaEventId = joi.number().integer()


const mwGetEventById = async (req, res, next) => {

    let eventId = undefined

    if ( req.validParams && ('eventId' in req.validParams)) {
        eventId = req.validParams.eventId

        logger.verbose(`eventId ${eventId} found in req.validParams`)
    }
    else if (req.params && ('eventId' in req.params)) {

        logger.verbose(`eventId ${req.params.eventId} found in req.params`)
        
        try {
            eventId = await schemaEventId.validateAsync(req.params.eventId)
    
            pushValidParams(req, { eventId })
        }
        catch(err) {
    
            logger.error(`mwGetEventById() encountered an error while validating eventId; `, err)
    
            if (err instanceof joi.ValidationError) {
                return res.status(404).json({ code: 404, message: 'unknown endpoint' })
            }
            else {
                return res.status(500).json({ code: 500, message: 'internal server error' })
            }
        }
    }
    else {
        // TODO: can i reach this situation?
    }

    logger.info(`will get event for id ${eventId} typeof '${typeof eventId}'`, )

    try {
        const event = eventsdb.getEventById(eventId)

        logger.info(`get event by id ${eventId} successful`)
        logger.debug('event ', { debugExtras: event })

        pushValidBody(req, { event })

        next()
    }
    catch(err) {

        logger.error(`mwGetEventById(eventId=${eventId}) encountered an error while quering database; `, err)

        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no event found with id ${eventId}` })
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error' })
        }
    }
}

module.exports = {
    mwGetEventById
}
