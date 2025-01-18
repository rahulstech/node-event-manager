const joi = require('joi')

const { errorcodes, EventDB, EventDBError, EventStatus } = require('../../database/eventsdb')

const loggers = require('../../utils/loggers')

const { pushValidBody, isDateTimeBetween } = require('../../utils/helpers')

const logger = loggers.logger.child({ module: 'GuestDataService' })

const eventdb = EventDB.create()

const mwGetAllGuestsForEvent = async (req, res, next) => {
    const { eventId } = req.validParams

    logger.info(`get all guests for event ${eventId}`)

    try {
        const guests = eventdb.getAllGuestsForEvent(eventId)

        logger.debug(`all guests for event ${eventId}`, { debugExtras: guests })
 
        pushValidBody(req, { guests })

        next()
    }
    catch(err) {
        logger.error(`mwGetAllGuestsForEvent(eventId=${eventId}) encountered an error: `, err)
        
        return res.status(500).json({ code: 500, message: 'internal server error'})
    }
}

const mwSearchGuestsForEvent = async (req, res, next) => {
    const { eventId } = req.validParams
    const { k } = req.query

    logger.info(`search guests for event ${eventId} and query`)
    logger.debug('query ', { debugExtras: { k }})

    try {
        const guests = eventdb.filterGuestsForEvent(eventId, k)

        logger.info(`search guests for event with id ${eventId} successful`)
        logger.debug(`guests `, { debugExtras: guests })

        pushValidBody(req, { guests })

        next()
    }
    catch (err) {
        logger.error(`mwSearchGuestsForEvent(eventId=${eventId}) encountered an erro; `, err)

        return res.status(500).json({ code: 500, message: 'internal server error'})
    }
}

const schemaGuestId = joi.number().integer()

const mwGetGuestById = async (req, res, next) => {
    const { guestId } = req.params

    logger.info(`will get guest for id ${guestId}`)

    try {
        const validGuestId = await schemaGuestId.validateAsync(guestId)

        const guest = eventdb.getGuestById(validGuestId)

        logger.info(`get guest by id ${guestId} successful`)
        logger.debug('guest ', { debugExtras: guest })

        pushValidParams(req, { guestId: validGuestId, eventId: guest.eventId })
        pushValidBody(req, { guest })

        next()
    }
    catch(err) {

        logger.error(`mwGetGuestById(guestId=${guestId}) encountered an error; `, err)

        if (err instanceof EventDBError && err.code === errorcodes.NOT_FOUND) {
            return res.status(404).json({ code: 404, message: `no guest found with id ${guestId}` })
        }
        else if (err instanceof joi.ValidationError) {
            return res.status(404).json({ code: 404, message: 'unknown endpoint' })
        }
        else {
            return res.status(500).json({ code: 500, message: 'internal server error' })
        }
    }
}

const mwUpdateGuest = async (req, res, next) => {

    const { guestId } = req.validParams
    const { guest, guestData } = req.validBody 

    try {

        const data = { ...guest, ...guestData }

        const updatedGuest = await eventdb.updateGuest(guestId, data)

        logger.info('guest updated successfully')
        logger.debug('updated guest', { debugExtras: updatedGuest })

        pushValidBody(req, { updatedGuest })
        
        next()
    }
    catch(err) {
        return res.status(500).json({ code: 500, message: 'internal server error'})
    }
}

const mwAddGuest = async (req, res, next) => {

    const { eventId } = req.validParams
    const { guestData } = req.validBody 

    try {
        const newGuest = await eventdb.addGuestForEvent(eventId, guestData)

        logger.info('guest added successfully')
        logger.debug('added guest ', { debugExtras: newGuest })

        pushValidBody(req, { newGuest })
        
        next()
    }
    catch(err) {
        return res.status(500).json({ code: 500, message: 'internal server error'})
    }
}

const mwRemoveGuest = async (req, res, next) => {

    const { guestId } = req.validParams

    logger.log('will remove guest')

    try {
        await eventdb.removeGuest(guestId)

        logger.info('guest removed successfully')

        next()
    }
    catch(err) {
        logger.log('mwRemoveGuest() encountered an error; ', err)
        return res.status(500).json({ code: 500, message: 'internal server error' })
    }
}

module.exports = {
    mwGetAllGuestsForEvent, mwSearchGuestsForEvent, mwGetGuestById, mwUpdateGuest, mwAddGuest, mwRemoveGuest
}