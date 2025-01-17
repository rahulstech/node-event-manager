const joi = require('joi')

const schema = joi.object({
    sex: joi.string().valid('MALE', 'FEMALE', 'OTHER')
})

function printResult(name, passed, extras = null) {
    if (passed) {
        console.log(`test ${name}: passed`)
    }
    else {
        console.log(`test ${name}: failed; extras = `, extras)
    }
}

function exampleValidSex() {
    const { error, value } = schema.validate({ 
        sex: 'MALE'
    })
    printResult('exampleValidSex', !error, value)
}

function exampleIgnoredSex() {
    const { error, value } = schema.validate({ 
        
    })
    printResult('exampleIgnoredSex', !error, value)
}

function exampleUnknownSex() {
    const { error, value } = schema.validate({ 
        sex: 'UNKNOWN'
    })
    printResult('exampleUnknownSex', error, value)
}

function exampleSexLowerCase() {
    const { error, value } = schema.validate({ 
        sex: 'female'
    })
    printResult('exampleSexLowerCase', error, value)
}

exampleValidSex()

exampleIgnoredSex()

exampleSexLowerCase()

exampleUnknownSex()