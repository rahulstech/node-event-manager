const { rm } = require('node:fs/promises')

const { existsSync } = require('node:fs')

const path = require('node:path')

const { Router } = require('express')

const multer = require('multer')

const loggers = require('../utils/loggers')

const { mwAddGuestForEventValidateBody, mwGetAllGuestsForEventValidator, mwSearchGuestsForEventValidator,
        mwUpdateGuestValidateBody, mwGetGuestByIdValidator, mwRemoveGuestValidator,

     } = require('../services/inputValidation/GuestInputValidationService')

const { catchRequestHandlerAsync } = require('../utils/errors')

const { addGuestForEvent, getAllGuestsForEvent, searchEventGuests, getGuestById, updateGuest, removeGuest, getGuestImage,
    } = require('../controllers/api/GuestController')

const multipart = multer({ dest: process.env.GUESTS_IMAGE_STORE })

/** Routers */

// api v1

const router1 = Router()

router1.get('/events/:eventId/guests', catchRequestHandlerAsync(mwGetAllGuestsForEventValidator) , catchRequestHandlerAsync(  getAllGuestsForEvent))

router1.get('/events/:eventId/guests/search', catchRequestHandlerAsync(mwSearchGuestsForEventValidator), catchRequestHandlerAsync( searchEventGuests))

router1.get('/guests/:guestId', catchRequestHandlerAsync(mwGetGuestByIdValidator), catchRequestHandlerAsync( getGuestById ))

router1.post('/events/:eventId/guests', multipart.single('guest_image'), catchRequestHandlerAsync(mwAddGuestForEventValidateBody), catchRequestHandlerAsync( addGuestForEvent))

router1.put('/guests/:guestId', multipart.single('guest_image'), catchRequestHandlerAsync(mwUpdateGuestValidateBody), catchRequestHandlerAsync( updateGuest))

router1.delete('/guests/:guestId', catchRequestHandlerAsync(mwRemoveGuestValidator), catchRequestHandlerAsync( removeGuest))

// guest images

const routerGuestImages = Router()

routerGuestImages.get('/guest_images/:guestImage', catchRequestHandlerAsync(getGuestImage))

module.exports.guestRoutes = { 

    api: {
        v1: router1
    },

    guestImages: routerGuestImages
}