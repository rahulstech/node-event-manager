const { Sequelize, DataTypes } = require('sequelize')
const path = require('node:path')
const moment = require('moment')

const DB_PATH = path.resolve(__dirname, 'databases/database.db3')

const sequelize = new Sequelize(`sqlite://${DB_PATH}`)

const TestValidate = sequelize.define('TestValidate', {
    id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },

    /**
     * instead of Date type i choose String type of length 16 becuase with Date time sequelize use Date object
     * and date object is stored as string in default datetime format of Date in database but i want it to strore
     * it in YYYY-MM-DD HH:mm foramt so i choose string. 
     * 
     * Alternatively i can create custom datatype for this purpose.
     */

    datetimeStart: {
        type: DataTypes.STRING(16),

        get() {
            const rawValue = this.getDataValue('datetimeStart')
            if (!rawValue) {
                return undefined
            }
            return moment(rawValue, 'YYYY-MM-DD HH:mm', true).toDate()
        },

        set(value) {
            const formatted = moment(value.toUTCString()).format('YYYY-MM-DD HH:mm')
            this.setDataValue('datetimeStart', formatted)
        },
    },
    datetimeEnd: {
        type: DataTypes.STRING(16),

        get() {
            const rawValue = this.getDataValue('datetimeEnd')
            if (!rawValue) {
                return undefined
            }
            return moment(rawValue, 'YYYY-MM-DD HH:mm', true).toDate()
        },

        set(value) {
            const formatted = moment(value.toUTCString()).format('YYYY-MM-DD HH:mm')
            this.setDataValue('datetimeEnd', formatted)
        }
    },
}, {
    tableName: 'tbl_test_validate',
    timestamps: false,
    validate: {
        // added this model validator. it is useful when validating based on more than one attributes on the model
        // like in the following case i am checking datetimeEnd is after datetimeStart
        checkEndIsAfterStart() {
            // const start = moment(this.datetimeStart, 'YYYY-MM-DD HH:mm', true)
            // const end = moment(this.datetimeEnd, 'YYYY-MM-DD HH:mm', true)

            // if (!start.isValid()) {
            //     throw new Error(`datetimeStart ${this.datetimeStart} is invalid`)
            // }
            // if (!end.isValid()) {
            //     throw new Error(`datetimeEnd ${this.datetimeEnd} is invalid`)
            // }

            // datetimeStart and datetimeEnd are now Date instances. So, pasing is not required

            const start = moment(this.datetimeStart)
            const end = moment(this.datetimeEnd)

            if (!end.isAfter(start)) {
                throw new Error(`end ${this.datetimeEnd} must be after start ${this.datetimeStart}`)
            }
        }
    }
});

(async () => {
    try {
        await sequelize.authenticate()
        console.log('Database connected successfully')

        await sequelize.sync({ force: true })
        console.log('Database synced successfully')

        await runTests()

        // await set_and_get()
    }
    catch(err) {
        console.log(err)
    }
})();

async function set_and_get() {

    const newValue = await TestValidate.create({ datetimeStart: new Date(2023, 5, 16, 5, 30), datetimeEnd: new Date(2023, 5, 16, 6, 0)})
    
    const found = await TestValidate.findOne({
        where: {
            id: newValue.id
        }
    })

    console.log('found one by id ', newValue.id, ' is ', found.toJSON())
}

async function runTests() {
    async function testInvalidInput() {
        const data = { datetimeStart: new Date(2023,4,16, 7, 50), datetimeEnd: new Date(2023,4,16, 6,0) }
        try {
            const newRow = await TestValidate.create(data)
            console.log('data: ', data,' new row: ', newRow.toJSON())
        }
        catch(err) {
            console.log('can not create ', data, ' because ', err)
        }
    }
    
    // async function testInvalidFormat1() {
    //     const data = { datetimeStart: '07:50', datetimeEnd: '2023-05-16 15:60' }
    //     try {
    //         const newRow = await TestValidate.create(data)
    //         console.log('data: ', data,' new row: ', newRow.toJSON())
    //     }
    //     catch(err) {
    //         console.log('can not create ', data, ' because ', JSON.stringify(err))
    //     }
    // }
    
    // async function testInvalidFormat2() {
    //     const data = { datetimeStart: '2023-05-16 07:50', datetimeEnd: '2023-05-16' }
    //     try {
    //         const newRow = await TestValidate.create(data)
    //         console.log('data: ', data,' new row: ', newRow.toJSON())
    //     }
    //     catch(err) {
    //         console.log('can not create ', data, ' because ', JSON.stringify(err))
    //     }
    // }
    
    async function testValidInput() {
        const data = { datetimeStart: new Date(2023,4,16, 7, 50), datetimeEnd: new Date(2023,4,16, 8,0) }
        try {
            const newRow = await TestValidate.create(data)
            console.log('data: ', data,' new row: ', newRow.toJSON())
        }
        catch(err) {
            console.log('can not create ', data, ' because ', err)
        }
    }
    
    
    await testInvalidInput()

    // await testInvalidFormat1()

    // await testInvalidFormat2()

    await testValidInput()
}

