const moment = require('moment')

let now = moment(Date.now()).format('hh:mm:ss.SSS a')

module.exports.now = now