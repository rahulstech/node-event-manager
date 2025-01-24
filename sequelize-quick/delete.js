/** 
 * 
 * ModelName.destroy( options ): use staic method destroy( options ) to run delete query. if where key not exits in options then it delete all entries in the table.
 * otherwise it delete only the matched rows. returns the no. of deleted rows on success. 
 * 
 * turncate() static method on model class can be used to delete all records
 * 
 * modelInstance.destroy( options ): use instance method to delete the particular row. it does not take any where clause.returns the deleted instance.
 */
const { Sequelize, DataTypes } = require('sequelize')

const sequelize = new Sequelize('sqlite::memory:')

const Task = sequelize.define('Task',{
    title: {
        type: DataTypes.STRING,
        allowNull: false,
    },

    complete: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        default: false
    }
},{timestamps: false});


(async () => {

    await sequelize.authenticate()

    await sequelize.sync()

    await addTasks()

    await runTests()
})()

async function addTasks() {
    const tasks = [
        { title: 'Learn Sequelize CRUD', complete: false },
        { title: 'Learn Winston Logging', complete: true },
        { title: 'Learn Multer', complete: true }
    ]

    for( const task of tasks) {
        try {
            const model = await Task.create(task)
            console.log('data: ', task, ' model: ', model.toJSON())
        }
        catch(err) {

        }
    }
}

async function runTests() {
    const tests = [
        delete_allComplete, delete_SpecificComplete
    ]

    for (const test of tests ){
        try {
            await test()
        }
        catch(err) {
            console.log(err)
        }
    }
}

async function delete_allComplete() {
    const result = await Task.destroy({
        where: {
            complete: true
        }
    })

    console.log('delete all completed tasks result=', result)
}

async function delete_SpecificComplete() {
    const task = await Task.findOne({ where: 1 })
    const result = await task.destroy()

    console.log('delete task: ', task.toJSON(), ' result ', result.toJSON())
}