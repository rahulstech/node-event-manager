const { DataTypes } = require("sequelize");

module.exports = ( sequelize ) => {

    const userModel = sequelize.define('User', {
        id: {
            type: DataTypes.UUID,
            primaryKey: true,
            defaultValue: DataTypes.UUIDV4
        },
        username: {
            type: DataTypes.STRING,
            unique: true
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false
        }
    }, {
         modelName: 'User',
         timestamps: false,
    })

    return userModel
}