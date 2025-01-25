const { DataTypes } = require('sequelize')
const { enumValues, parseDateTime, formatDateTime, isDateTimeAfter } = require('../utils/helpers')

const EventStatus = {

    PENDING: 'PENDING', RUNNING: 'RUNNING', CANCELED: 'CANCELED', FINISHED: 'FINISHED',

    values: () => enumValues(EventStatus)
}

const initEvent = ( sequelize ) => {

    const Event = sequelize.define('Event', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },

        title: {
            type: DataTypes.STRING,
            allowNull: false
        },

        description: {
            type: DataTypes.TEXT,
            allowNull: false
        },

        organizer: {
            type: DataTypes.STRING,
            allowNull: false
        },

        venu: {
            type: DataTypes.STRING,
            allowNull: false
        },

        eventStart: {
            field: 'event_start',
            type: DataTypes.STRING(16),
            allowNull: false,
        },

        eventEnd: {
            field: 'event_end',
            type: DataTypes.STRING(16),
            allowNull: false,
        },

        status: {
            type: DataTypes.STRING,
            allowNull: false,
            default: EventStatus.PENDING,
            validate: {
                checkEventStatus() {
                    const status = this.status
                    if (!EventStatus.values().includes(status)) {
                        throw new Error(`invalid event status ${status}`)
                    }
                }
            }
        },
    }, {
        tableName: 'events',
        timestamps: false,
        validate: {
            eventEndsAfterStart() {
                const start = parseDateTime(this.eventStart)
                const end = parseDateTime(this.eventEnd)

                if (!isDateTimeAfter(end, start)) {
                    throw new Error('event end must be after event start')
                }
            }
        }
    })

    return Event
}

module.exports = { initEvent, EventStatus }