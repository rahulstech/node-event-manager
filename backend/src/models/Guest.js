const { DataTypes } = require('sequelize')
const { enumValues, isDateTimeAfter } = require('../utils/helpers')

const Sex = {

    MALE: 'MALE', FEMALE: 'FEMALE', OTHER: 'OTHER',

    values: () => enumValues(Sex)
}

const GuestStatus = {

    NOTSET: 'NOTSET', PRESENT: 'PRESENT', ABSENT: 'ABSENT',

    values: () => enumValues(GuestStatus)
}

const initGuest =( sequelize ) => {

    const Guest = sequelize.define('Guest', {

        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,
        },

        firstname: {
            type: DataTypes.STRING,
            allowNull: false
        },

        lastname: {
            type: DataTypes.STRING,
        },

        age: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },

        sex: {
            type: DataTypes.STRING,
            allowNull: false,
            validate: {
                checkSex() {
                    const sex = this.sex
                    if (!Sex.values().includes(sex)) {
                        throw new Error(`invalid sex ${sex}`)
                    }
                },
            }
        },

        guestImage: {
            field: 'guest_image',
            type: DataTypes.TEXT,
            allowNull: false
        },

        isPresent: {
            field: 'is_present',
            type: DataTypes.STRING(15),
            allowNull: false,
            defaultValue: GuestStatus.NOTSET,
            validate: {
                checkIsPresent() {
                    const isPresent = this.isPresent
                    if (!GuestStatus.values().includes(isPresent)) {
                        throw new Error(`invalid "is_present" ${isPresent}`)
                    }
                }
            }
        },

        guestEnter: {
            field: 'guest_enter',
            type: DataTypes.DATE,
        },

        guestExit: {
            field: 'guest_exit',
            type: DataTypes.DATE,
        },

    }, {
        tableName: 'guests',
        timestamps: false,
        validate: {
            checkExitIsAfterEnter() {
                const enter = this.guestEnter
                const exit = this.guestExit
                if (enter && exit && !isDateTimeAfter(exit, enter, true)) {
                    throw new Error('guest exit must be same or after enter')
                }
            },

            checkHasEnterExitWhenPresent() {
                const isPresent = this.isPresent
                const enter = this.guestEnter
                const exit = this.guestExit

                if (isPresent === GuestStatus.PRESENT && (!enter || !exit)) {
                    throw new Error(`both guest enter and exit is required when is_present set ${GuestStatus.PRESENT}`)
                }
            }
        }
    })

    return Guest
} 

module.exports = { initGuest, Sex, GuestStatus }