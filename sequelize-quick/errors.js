const { Sequelize, DataTypes, ValidationError, DatabaseError, BaseError } = require('sequelize')

const { runAsyncTests } = require('./helpers')

const sequelize = new Sequelize('sqlite::memory:')

const Inventory = sequelize.define('Inventory', {

    name: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
            minLen: 5
        }
    },

    quantity: {
        type: DataTypes.REAL,
        allowNull: true,
        defaultValue: 0,
        validate: {
            min: 0
        }
    }

}, { timestamps: false });

(async () => {
    try {
        await sequelize.authenticate()

        await sequelize.sync()

        await runAsyncTests([
            { name: "null name", test: testNullName },
            { name: 'null name and quantity', test: testNullNameAndQuantity},
            { name: 'quantity -1', test: testInvalidQuantity }
        ], (err, name) => {
            console.log('err instance of BaseError: ', (err instanceof BaseError))
            console.log('err instance of DatabaseError: ', (err instanceof DatabaseError))
            console.log('err instance of ValidationError: ', (err instanceof ValidationError))
            console.log(name, JSON.stringify(err, null, 3))
        })
    }
    catch(err) {
        console.log(err)
    }
})()

async function testNullName() {
    await Inventory.create({ quantity: 10 })
}

async function testNullNameAndQuantity() {
    await Inventory.create({ })
}

async function testInvalidQuantity() {
    await Inventory.create({  quantity: -1 })
}