const { sequelize, TrainDetails, BookingDetails, connect } = require('./database')
const { Op, col } = require('sequelize')


function printResult(result, tag) {
    if (result) {
        result.forEach(r => {
            console.log("============================================================")
            console.log(r.toJSON())
        });
    }
    else {
        console.log(`empty result for ${tag}`)
    }
}

// get trains running between Delhi and Mumbai and availble on atlest Monday and Wednessday
async function query1() {
    console.log('get trains running between delhi and mumbai and available on atleast Monday and Wednessday')
    const result = await TrainDetails.findAll({
        where: {
            [Op.and]: [
                {
                    [Op.or]: [ 
                        { source: { [Op.in]: ['Mumbai', 'Delhi'] }},
                        { destination: { [Op.in]: ['Mumbai', 'Delhi'] }}
                    ]
                },
                { availability: { [Op.like]: '%M%W%' }}
            ]
        } 
    })

    printResult(result, 'query1')
}

// get bookings where ( ( status CNC with data between 2024-05-01 and 2024-09-30) or ( status WAT and date after today ))
// and ( age >= 60 or coach name either start with 'A' or 'B')
async function query2() {
    const result = await BookingDetails.findAll({
        where: {
            [Op.and]: [
                { [Op.or]: [
                    {[Op.and]: [
                         { bookingStatus: 'CNC' },
                         { travelDate: { [Op.between]: [sequelize.fn('DATE','2024-05-01'), sequelize.fn('DATE','2024-09-30')] }}
                    ]},
                    {
                        [Op.and]: [
                            { bookingStatus: 'WAT' },
                            { travelDate: { [Op.gt]: sequelize.fn('DATE', 'now') }}
                        ]
                    }
                ] },
                { [Op.or]: [
                    { age: { [Op.gte]: 60} },
                    { coach: { [Op.like]: 'A%' } },
                    { coach: { [Op.like]: 'B%' } }
                ] }
            ]
        }
    })

    printResult(result, 'query2')
}


// calculate total number of local trains on route between Hydrabad and Agra, consider also intermediate stations
async function query3() {
    console.log('calculate total number of local trains on route between Hydrabad and Agra, consider also intermediate stations')
    const results = await TrainDetails.findAll({
        attributes: [[sequelize.fn('COUNT', sequelize.col('id')), 'count_trains']],
        where: {
            [Op.and]: [
                { type: 'LOCAL' },
                { trainName: { [Op.or]: [ {[Op.like]: '%Hydrabad%'}, {[Op.like]: '%Agra%'}] }}
            ]
        }
    })

    printResult(results, 'query3')
}

// get train details only trai number, name, start and end time for trains that starts or ends between 5 and 9 am
//  and order by start and end time descending
async function query4() {
    console.log('get train details only trai number, name, start and end time for trains that starts or ends between 5 and 9 am '+
        '  and order by start and end time descending')
    const results = await TrainDetails.findAll({
        attributes: ['trainNumber','trainName', 'startTime', 'endTime'],
        where: {
            [Op.or]: [
                { startTime: { [Op.between]: [sequelize.fn('TIME', '05:00'), sequelize.fn('TIME', '09:00')] }},
                { endTime: { [Op.between]: [ sequelize.fn('TIME', '05:00'), sequelize.fn('TIME', '09:00')] }}
            ]
        },
        order: [ 'startTime', 'endTime' ]
    })

    printResult(results, 'query4')
}

async function query5_NotWorking() {
    

    const results = await TrainDetails.findAll({

        // NOTE: attributes are the name in the model not the name of the columns
        // when attributes is provided then select query will pick only those columns
        attributes: ['trainNumber', 'trainName'],

        // use include to add custom column defination or adding columns from associated table
        include: [
            {
                model: BookingDetails,
                attributes: [
                    [sequelize.fn('COUNT', sequelize.col('BookingDetails.id')), 'total_passengers'], // Use 'id' attribute here
                    'bookingStatus',
                ],
            },
        ],
        where: {
            trainName: {
                [Op.or]: [
                    { [Op.like]: '%Bangalore%' },
                    { [Op.like]: '%Kolkata%' }
                ]
            }
        },
        group: [
            'trainNumber',
            'bookingStatus' // problem: neither bookingStatus nor BookingDetails.bookingStatus executes successfully
        ], 
    });

    printResult(results, 'query5');
}


async function query5() {

    // query 5 can be perfomed using sequelize raw query feature, i will get the expected result.
    // but the pproblem is i have to compromise with the model feature. raw queries returns plain js objects
    // at most 1 level of model creation accurate

    const results = await sequelize.query("select train_number, train_name, count(bookings.id) as total_passengers, booking_status as 'TrainDetails..bookingStatus' "+
        "from train_details trains left join booking_details bookings on trains.id = bookings.train_id "+
        "where train_name like '%Bangalore%' or train_name like '%Kolkata%' group by train_number, booking_status;")

    printResult(results, 'query5')
}

(async () => {

    await connect()

    // query1()

    // query2()

    // query3()

    // query4()

    query5()

})()