const { Sequelize } = require('sequelize')
const path = require('node:path')

const sequelize = new Sequelize({
    storage: path.resolve(__dirname, '..', 'database', 'database.sqlite'),
    dialect: 'sqlite'
})

const User = require('./User')(sequelize)

module.exports = {
    sequelize, 
    User,
}