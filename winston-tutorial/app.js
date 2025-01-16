// const winston = require('winston');

// // Define custom format
// const customFormat = winston.format.printf( info => {
//     const { timestamp, tag, level, message, ...meta } = info;
//     let log = `${timestamp} [${level}] [${tag}] ${message}`;
//     if (Object.keys(meta).length) {
//         log += ` | meta: ${JSON.stringify(meta)}`;
//     }
//     return log;
// });

// // Create a Winston logger instance
// const logger = winston.createLogger({
//     level: 'info',
//     format: winston.format.combine(
//         winston.format.timestamp(),
//         customFormat
//     ),
//     transports: [
//         new winston.transports.Console()
//     ]
// });

// const clogger = logger.child({ tag: 'this is child logger '})

// // Log messages with extra values
// clogger.info('This is an info message', { userId: 123, action: 'login' });
// logger.warn('This is a warning message', { userId: 123, action: 'attempted unauthorized access' });
// logger.error('This is an error message', { userId: 123, error: 'Invalid credentials' });

const path = require('node:path')
const { isObject } = require('node:util')
const winston = require('winston')
const { combine, timestamp, errors, printf, cli, uncolorize, json } = winston.format

const logger = winston.createLogger({ 
    // format: combine(
    //     timestamp(),
    //     errors({ stack: true}),
    //     printf( info => {
    //         const { timestamp, level, tag, stack, ...meta} = info
    //         let output = `[${timestamp}] [${tag}] [${level}] ${info.message} `
    //         if (Object.keys(meta).length > 0) {
    //             output += JSON.stringify(meta)
    //         }
    //         if (stack) {
    //             output += `\n${stack}`
    //         }
    //         return output
    //     })
    // ),
    transports: [
        new winston.transports.Console({ 
            level: 'silly',
            format: combine(
                timestamp(),
                errors({ stack: true}),
                printf( info => {
                    const { timestamp, level, tag, message, stack, extras } = info
                    let output = `[${timestamp}] [${tag}] [${level}] `
                    if ((typeof message) == 'string') {
                        output += message
                    }
                    else {
                        output += JSON.stringify(message)
                    }
                    if (extras) {
                        output += ' ' + JSON.stringify(extras)
                    }
                    if (stack) {
                        output += `\n${stack}`
                    }
                    return output
                })
            ),
         }),
         new winston.transports.File({
            level: 'silly',
            filename: path.resolve(__dirname, 'logs/app.log'),
            format: combine(
                timestamp(),
                uncolorize(),
                json()
            )
         })
    ]
})


const clogger = logger.child({ tag: 'child-logger1'})

clogger.info('this is an info ')
clogger.debug('hello',{ extras: { userId: 12, message: 'hello' } })
clogger.error(new Error('this is an error'))