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
            allowNull: false,
            unique: true
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false
        }
    }, {
         modelName: 'User',
         tableName: 'tbl_users',
         timestamps: false,
    })

    return userModel
}