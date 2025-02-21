const { rm } = require('node:fs/promises')

const { resolve } = require('node:path')

const { AppError } = require('../../utils/errors')

const loggers = require('../../utils/loggers')

const logger = loggers.logger.child({ module: 'GuestImageService' })

const removeGuestImage = async ( filename ) => {

    const imagePath = resolve(process.env.GUESTS_IMAGE_STORE, filename)

    try {
        await rm(imagePath, { maxRetries: 2 }) // TODO: check max remove retry
    }
    catch(err) {
        if (err.code === 'ENOENT') {
            // file does not exists
            logger.warn(`guest image file at '${imagePath}' does not exists`)
        }
        else {
            logger.error(`delete guest image file failed; `, err)
        }
    }
}


module.exports = {
    removeGuestImage, 
}