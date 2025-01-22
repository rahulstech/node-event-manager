const { DataTypes } = require("sequelize")

module.exports = ( sequelize ) => {
    const postModel = sequelize.define('Post',
        {
            id: {
                type: DataTypes.UUID,
                primaryKey: true,
                defaultValue: DataTypes.UUIDV4,
            },

            title: {
                type: DataTypes.STRING,
                allowNull: false,
                validate: { len: [1, 200] }
            },

            content: {
                type: DataTypes.TEXT,
            },
        },
        {
            tableName: 'tbl_posts',
            timestamps: false,
        }
    )

    return postModel
}