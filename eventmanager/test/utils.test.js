const utils = require('../src/utils')
const asserts = require('node:assert')

function test_parseDateTime() {
    const validInput = "2023-05-15 14:30"
    const datetime = utils.parseDateTime(validInput)

    console.log(`'${validInput}' = ${datetime}`)   
}

function test_formatDateTime() {
    const validInput = new Date(2023,4,16,14,5)
    const datetime = utils.formatDateTime(validInput)

    console.log(`'${validInput}' = ${datetime}`)   
}



const tests = [
    test_parseDateTime, test_formatDateTime
]

tests.forEach( fn => {
    fn()
})