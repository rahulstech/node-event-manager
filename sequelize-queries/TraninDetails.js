const { DataTypes } = require('sequelize')


/**
 * 
 * #-- Table: train_details
#CREATE TABLE train_details (
#    id INTEGER PRIMARY KEY AUTOINCREMENT,
#    train_name TEXT NOT NULL,
#    train_number TEXT NOT NULL UNIQUE,
#    train_source_station TEXT NOT NULL,
#    train_destination_station TEXT NOT NULL,
#    start_time TEXT NOT NULL, -- Format: HH:mm
#    end_time TEXT NOT NULL,   -- Format: HH:mm
#    type TEXT CHECK(type IN ('LOCAL', 'MEMU', 'EMU', 'EXPRESS')) NOT NULL,
#    availability TEXT NOT NULL
#);
 */
module.exports = (sequelize) => {
    const model = sequelize.define('TrainDetails', {
        id: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        trainName: {
            field: 'train_name',
            type: DataTypes.STRING,
            allowNull: false,
        },
        trainNumber: {
            field: 'train_number',
            type: DataTypes.STRING,
            allowNull: false,
            unique: true,
        },
        source: {
            field: 'train_source_station',
            type: DataTypes.STRING,
            allowNull: false,
        },
        destination: {
            field: 'train_destination_station',
            type: DataTypes.STRING,
            allowNull: false,
        },
        stringTime: {
            field: 'start_time',
            type: DataTypes.TIME,
            allowNull: false,
        },
        endTime: {
            field: 'end_time',
            type: DataTypes.TIME,
            allowNull: false,
        },
        type: {
            type: DataTypes.ENUM('LOCAL', 'MEMU', 'EMU', 'EXPRESS'),
            allowNull: false
        },
        availability: {
            type: DataTypes.STRING,
            allowNull: false
        }
    },{
        tableName: 'train_details',
        timestamps: false,
    })

    return model
}