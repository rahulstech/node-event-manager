
class AppError extends Error {

    constructor(message = 'internal server error', statusCode = 500, isOperational = true, stack = '') {
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

    fn(req, res, next).catch(err =>{ 
        if (err instanceof AppError) {
            next(err)
        }
        else {
            next(new AppError(err.message, 500, false, err.stack))
        }
     })
}

module.exports = {
    AppError,
    catchRequestHandlerAsync,
}

