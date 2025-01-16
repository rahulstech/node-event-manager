const path = require('node:path')
const winston = require('winston')
const Transport = require('winston-transport')
const { combine, timestamp, errors, colorize, printf, json } = winston.format

/**
 * A winston transport that does not log anything. Winston does not allow no transport.
 * But we don't need logging during test. Hence this custom transport is the solution.
 * Add this transport to the logger add other loggers according to the environment type,
 * like production, development etc. 
 */
class DoNothingTransport extends Transport {

    constructor() {
        super({})
    }

    log(info, callback) {
        setImmediate(() => this.emit('logged', info))
        callback()
    }
}

const logger = winston.createLogger({
    transports: [
        new DoNothingTransport()
    ]
})

if (process.env.NODE_ENV === 'development') {
    logger.add(new winston.transports.Console({
        level: 'debug',
        format: combine(
            timestamp(),
            errors({ stack: true }),
            colorize(),
            printf( info => {
                let output = `[${info.timestamp}] [${info.level}] [${info.module}] ${info.message} `
                if (info.debugExtras) {
                    output += `\n${JSON.stringify(info.debugExtras, null, 2)}`
                }
                if (info.stack) {
                    output += `\n${info.stack}`
                }
                return output
            })
        )
    }))
}

if (process.env.NODE_ENV === 'production') { 
    logger.add(
        new winston.transports.File({
            filename: path.resolve(process.env.LOG_STORE, 'events.log'),
            level: 'info',
            format: combine(
                timestamp(),
                errors({ stack: true }),
                json()
            )
        })
    )
}

module.exports = { logger }