const moment = require('moment')

// const dateObj = new Date(2023, 10, 15, 14, 30) // Jan -> 0 December -> 11

// const formatOptions = {
//     calendar: 'iso8601',
//     year: 'numeric',
//     month: '2-digit',
//     day: '2-digit',
//     hour: '2-digit',
//     minute: '2-digit',
//     hour12: true,
// }

// const datetimeText = Intl.DateTimeFormat('en', formatOptions).format(dateObj)

// console.log(`${dateObj} => '${datetimeText}'`)

// const result = moment('2023-MAY-15', 'YYYY-MMM-DD', true)

// const result = moment(dateObj)

// const formatted =  result.format('DD MMMM, yy hh:mm a')

// console.log(result.toObject())

// const x = moment('2023-05-14', 'YYYY/MM/dd' , true)

// const x = moment(undefined, 'YYYY/MM/dd' , true)

// console.log(x.isValid())

// const y = moment(new Date(2023, 5, 6))
const y = moment(null, true)

if (y.isValid()) {
console.log(y.format('DD MMMM, YYYY'))
}