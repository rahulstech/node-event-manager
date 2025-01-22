const { sequelize, TrainDetails, BookingDetails, connect } = require('./database')
const { Op, where } = require('sequelize')


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

    printResult(results, query3)
}

(async () => {

    await connect()

    // query1()

    // query2()

    query3()

})()