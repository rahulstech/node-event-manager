const { DataTypes } = require("sequelize")

module.exports = ( sequelize ) => {

    const tagModel = sequelize.define('Tag', {
        name: {
            type: DataTypes.STRING,
            primaryKey: true,
            validate: { len: [1, 30] },
        }
    }, {
        tableName: 'tbl_tags',
        timestamps: false,
    })

    return tagModel
}