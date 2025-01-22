const { Sequelize } = require('sequelize');
const path = require('node:path')

const sequelize = new Sequelize(`sqlite://${path.resolve(__dirname, 'database/TrainReservationSystem.db3')}`)

const TrainDetails = require('./TraninDetails')(sequelize);

const BookingDetails = require('./BookingDetails')(sequelize);

TrainDetails.hasMany(BookingDetails, {
    foreignKey: {
        name: 'trainId',
        field: 'train_id'
    }
});

const connect = async () => {
    await sequelize.authenticate()
    console.log('Database connected successfully')

    await sequelize.sync()
    console.log('Database synched successfully')
}

module.exports = {
    sequelize, TrainDetails, BookingDetails, connect
}