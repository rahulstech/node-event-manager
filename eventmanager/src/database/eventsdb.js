const path = require('node:path')
const { Sequelize, DatabaseError, ValidationError } = require('sequelize')
const { AppError } = require('../utils/errors')
const { initEvent, EventStatus } = require('./Event')
const { initGuest, Sex, GuestStatus } = require('./Guest')
const config = require('./eventsdb.config.json')
const loggers = require('../utils/loggers')

const logger = loggers.logger.child({ module: 'EventsDB' })

const captureDBErrorAsync = (dbTask) => {

    return new Promise(( resolve, reject) => {

        dbTask
        .then( result => { resolve(result) })
        .catch( err => {
            if (err instanceof DatabaseError) {
                // TODO: make DatabaseError logging better
                logger.error(err)
    
                reject(new AppError(err.message, 500, false, err.stack))
            }
            else if (err instanceof ValidationError) {
                const errors = err.errors.map( error => {
                    const reason = error.message
                    const model = error.instance === null ? null : error.instance.constructor.name
                    const validator = error.validatorKey || error.validatorName || null
    
                    return { reason, validator, model }
                })
    
                logger.error('Sequelize ValidationError', { debugExtras: errors })
    
                reject(new AppError(err.message, 500, true, err.stack))
            }
            else {
                reject(err)
            }
        })
    })
    // try {
    //     return await dbTask(...taskArgs)
    // }
    // catch(err) {
    //     if (err instanceof DatabaseError) {
    //         // TODO: make DatabaseError logging better
    //         logger.error(err)

    //         throw new AppError(err.message, 500, false, err.stack)
    //     }
    //     else if (err instanceof ValidationError) {
    //         const errors = err.errors.map( error => {
    //             const reason = error.message
    //             const model = error.instance === null ? null : error.instance.constructor.name
    //             const validator = error.validatorKey || error.validatorName || null

    //             return { reason, validator, model }
    //         })

    //         logger.error('Sequelize ValidationError', { debugExtras: errors })

    //         throw new AppError(err.message, 500, true, err.stack)
    //     }
    //     else {
    //         throw err
    //     }
    // }
}

function initModels(sequelize) {
    const Event = initEvent(sequelize)

    const Guest = initGuest(sequelize)

    Event.hasMany( Guest, { 
        foreignKey: {
            name: 'eventId',
            field: 'event_id',
            allowNull: false,
        }
    })

    Guest.belongsTo(Event, {
        foreignKey: {
            name: 'eventId',
            field: 'event_id',
            allowNull: false
        }
    })
    
    return { Event, Guest }
}

function initSequelize(dbConfig) {

    const sequelize = new Sequelize({
        ...dbConfig,

        logging: msg => logger.info(msg)
    })

    const models = initModels(sequelize)

    return { sequelize, ...models }
}

function initDatabase() {
    const NODE_ENV = process.env.NODE_ENV

    let dbConfig = null

    if (NODE_ENV === 'production') {
        dbConfig = config.production
    }
    else if (NODE_ENV === 'development') {
        dbConfig = config.development
    }
    else {
        dbConfig = config.test
    }

    const { dbFile } = dbConfig

    if (dbFile) {
        const storage = path.resolve(process.env.DATA_STORE, dbFile)
        dbConfig['storage'] = storage
    }

    const instances = initSequelize(dbConfig)

    return instances
}

const instances = initDatabase()

const { sequelize } = instances

const connectDatabase = async () => {
    await sequelize.authenticate()
}

const disconnectDatabase = async () => {
    await sequelize.close()
}

module.exports = { ...instances, EventStatus, Sex, GuestStatus, connectDatabase, disconnectDatabase, captureDBErrorAsync }
