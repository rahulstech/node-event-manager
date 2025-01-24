/**
 * Testing in case of seqlite do the enum datatype adds CHECK constraint automatically in the column defination.
 * 
 * Sequelize does not add column check constraint for enum datatype for sqlite by default because sqlite doest not supports enum
 * datatype natively. instead it set the column type text without any check constraint. 
 * 
 * To acheive enum like capability i can add validate column value that it is one of the permitted keys in enum or not.
 */
const { Sequelize, DataTypes } = require('sequelize') 

const sequelize = new Sequelize({
    storage: ':memory:',
    dialect: 'sqlite',
})

const EnumModel = sequelize.define('EnumModel', {
    status: { 
        type: DataTypes.STRING,
        defaultValue: 'PENDING',
        validate: {
            checkValidStatus() {
                const valid = ['PENDING', 'SUCCESSFUL', 'CANCELED']
                const value = this.getDataValue('status')
                if (!valid.includes(value)) {
                    throw new Error(`invalid status ${value}`)
                }
            }
        }
    }
}, {
    timestamps: false
});

(async () => {
    try {
        await sequelize.authenticate()
    
        await sequelize.sync()
    
        await runTests()
    }
    catch(err) {
        console.log(err)
    }
})()

async function runTests() {

    const tests = [ testValid, testInvalid, testDefaultValue ]

    for (const test of tests) {
        try {
            await test()
        }
        catch(err) {
            console.log(err)
        }
    }
}

async function testValid() {
    const data = { status: 'PENDING' }
    const model = await EnumModel.create(data)

    console.log('data: ', data, ', model: ', model.toJSON())
}

async function testInvalid() {
    const data = { status: 'UNKNOWN' }
    const model = await EnumModel.create(data)

    console.log('data: ', data, ', model: ', model.toJSON())
}

async function testDefaultValue() {
    const data = { }
    const model = await EnumModel.create(data)

    console.log('data: ', data, ', model: ', model.toJSON())
}