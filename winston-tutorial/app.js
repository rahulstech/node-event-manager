const winston = require('winston')
const moment = require('moment')
const { combine, timestamp, colorize, cli, printf, json } = winston.format


const logger = winston.createLogger({
    level: 'silly',
    format: combine(
        timestamp(),
        colorize(),
        printf(info => `[${moment(info.timestamp).format('YYYY-MM-DD HH:mm:SS')}] [${info.level}] [${info.tag}] ${info.message}`)
    ),
    transports: [
        new winston.transports.Console(),
        new winston.transports.File({ 
            filename: 'winston-tutorial/logs/app.log', 
            format: combine(timestamp(), json()),
            level: 'warn'
        })
    ],
    defaultMeta: { tag: 'winston-tutorial' }
})

logger.info('Hello, Winston!')
logger.warn('Warning message')
logger.error('Error message', { error: new Error('Something went wrong') })
logger.debug('Debugging info')
logger.silly('Silly message')
logger.verbose('Verbose message')
logger.http('HTTP message', { method: 'GET', url: 'http://example.com' })