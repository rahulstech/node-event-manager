const { Sequelize } = require('sequelize')
const path = require('node:path')

const sequelize = new Sequelize({
    // storage: path.resolve(__dirname, '..', 'database', 'database.sqlite'),
    storage: ':memory:',
    dialect: 'sqlite'
})

const User = require('./User')(sequelize);

const Post = require('./Post')(sequelize);

User.hasMany(Post, { 
    onDelete: 'CASCADE',
    foreignKey: {
        allowNull: false,
    }
 })
Post.belongsTo(User)

module.exports = {
    sequelize, 
    User, Post, 
}