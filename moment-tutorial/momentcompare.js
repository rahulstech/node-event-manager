const moment = require('moment')

const date1 = new Date(2024, 4, 15)

const date2 = new Date(2024, 5, 15)

const date3 = new Date(2024, 10, 15)

const moment1 = moment(date1)

const moment2 = moment(date2)

const moment3 = moment(date2)

const moment4 = moment(date3)

const moment5 = moment(date3)

console.log(` ${moment1} is after of ${moment2}: `, moment1.isAfter(moment2)) // moment1 > moment2

console.log(` ${moment1} is before of ${moment2}: `, moment1.isBefore(moment2)) // moment < moment2

console.log(` ${moment2} is same ${moment3}: `, moment2.isSame(moment3)) // moment2 = moment3

// isBetween excludes the both edges i.e.  momentStart < momentTest < momentEnd

console.log(` ${moment2} is between of ${moment1} and ${moment4}: `, moment2.isBetween(moment1, moment4))

console.log(` ${moment2} is between of ${moment3} and ${moment4}: `, moment2.isBetween(moment3, moment4))

console.log(` ${moment5} is between of ${moment3} and ${moment4}: `, moment5.isBetween(moment3, moment4))