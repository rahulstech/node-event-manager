const path = require('node:path')
const winston = require('winston')
const { combine, timestamp, errors, colorize, printf, json } = winston.format

const logger = winston.createLogger({

    transports: [
        new winston.transports.File({
            filename: path.resolve(process.env.LOG_STORE, 'events.log'),
            level: 'info',
            format: combine(
                timestamp(),
                errors({ stack: true }),
                json()
            )
        })
    ],
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

module.exports = { logger }