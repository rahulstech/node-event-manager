
class AppError extends Error {

    constructor(message = 'Internal Server Error', statusCode = 500, isOperational = true, stack = '') {
        super()
        this.name = this.constructor.name
        this.message = message
        this.statusCode = statusCode
        this.isOperational = isOperational
        if (stack) {
            this.stack = stack
        }
        else {
            Error.captureStackTrace(this, this.constructor)
        }
    }
}

const catchRequestHandlerAsync = ( fn ) => (req, res, next) => {

    fn(req, res, next).catch(err => next(err))
}

module.exports = {

    AppError,

    catchRequestHandlerAsync,
}

