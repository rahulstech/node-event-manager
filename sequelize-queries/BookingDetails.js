const { DataTypes } = require('sequelize')

/**
 * 
#CREATE TABLE booking_details (
#    id INTEGER PRIMARY KEY AUTOINCREMENT,
#    train_id INTEGER NOT NULL,
#    passenger_full_name TEXT NOT NULL,
#    age INTEGER NOT NULL CHECK(age >= 1 AND age <= 120),
#    sex TEXT CHECK(sex IN ('M', 'F')) NOT NULL,
#    travel_date DATE NOT NULL,
#    boarding_station_name TEXT NOT NULL,
#    destination_station_name TEXT NOT NULL,
#    coach_name TEXT CHECK(coach_name IN ('S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8', 'S9', 'S10', 'A1', 'A2', 'A3', 'A4', 'A5', 'B1', 'B2', 'B3', 'B4', 'B5', 'C1', 'C2', 'C3', 'C4', 'C5', 'D1', 'D2', 'D3', 'D4', 'D5')) NOT NULL,
#    seat_number INTEGER CHECK(seat_number >= 1 AND seat_number <= 75) NOT NULL,
#    booking_status TEXT CHECK(booking_status IN ('CNF', 'WAT', 'CNC')) NOT NULL,
#    FOREIGN KEY (train_id) REFERENCES train_details (id)
#);} sequelize 

 */
module.exports = ( sequelize ) => {

    const model = sequelize.define('BookingDetails', {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true,
        },
        passengerFullname: {
            field: 'passenger_full_name',
            type: DataTypes.STRING,
            allowNull: false,
        },
        age: {
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                min: 1,
                max: 120,
            }
        },
        sex: {
            type: DataTypes.ENUM('M', 'F'),
            allowNull: false,
        },
        travelDate: {
            field: 'travel_date',
            type: DataTypes.DATE,
            allowNull: false,
        },
        boarding: {
            field: 'boarding_station_name',
            type: DataTypes.DATE,
            allowNull: false,
        },
        destination: {
            field: 'destination_station_name',
            type: DataTypes.STRING,
            allowNull: false,
        },
        coach: {
            field: 'coach_name',
            type: DataTypes.ENUM('S1', 'S2', 'S3', 'S4', 'S5', 'S6', 'S7', 'S8', 'S9', 'S10', 'A1', 'A2', 'A3', 'A4', 'A5', 'B1', 'B2', 'B3', 'B4', 'B5', 'C1', 'C2', 'C3', 'C4', 'C5', 'D1', 'D2', 'D3', 'D4', 'D5'),
            allowNull: false,       
        },
        seat: {
            field: 'seat_number',
            type: DataTypes.INTEGER,
            allowNull: false,
            validate: {
                min: 1,
                max: 75,
            }
        },
        bookingStatus: {
            field: 'booking_status',
            type: DataTypes.ENUM('CNF', 'WAT', 'CNC'),
            allowNull: false,
        },
    }, {
        tableName: 'booking_details',
        timestamps: false,
    })

    return model
}