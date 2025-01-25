const path = require('node:path')
const { Sequelize } = require('sequelize')
const { AppError } = require('../utils/errors')
const { initEvent, EventStatus } = require('./Event')
const { initGuest, Sex, GuestStatus } = require('./Guest')
const config = require('./eventsdb.config.json')
const loggers = require('../utils/loggers')

const logger = loggers.logger.child({ module: 'EventsDB' })

function __convertToAppError(err) {

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

    await sequelize.sync()
}

const disconnectDatabase = async () => {
    await sequelize.close()
}

module.exports = { ...instances, EventStatus, Sex, GuestStatus, connectDatabase, disconnectDatabase }
