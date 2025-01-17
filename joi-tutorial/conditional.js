const joi = require('joi')

const schema = joi.object({
    has_key: joi.boolean().required(),
    key: joi.string().when('has_key', { is: true, then: joi.required() })
})

function exampleHasKeyFalse() {
    const { error, value } = schema.validate({ has_key: false })
    if (error) {
        console.log(value, ' must pass the test exampleHasKeyFalse')
    }
    else {
        console.log('test exampleHasKeyFalse: passed')
    }
}

function exampleHasKeyTrueButNoKey() {
    const { error, value } = schema.validate({ has_key: true })
    if (!error) {
        console.log('exampleHasKeyTrueButNoKey: must fail but passed value = ', value)
    }
    else {
        console.log('test exampleHasKeyTrueButNoKey: passed')
    }
}

function exampleHasKeyTrueWithKey() {

    const { error, value } = schema.validate({ has_key: true, key: 'thisisakey' })
    if (!error) {
        console.log('test exampleHasKeyTrueWithKey: passed')
    }
    else {
        console.log('exampleHasKeyTrueWithKey: should not fail for value = ', value)
    }
}

exampleHasKeyFalse()

exampleHasKeyTrueButNoKey()

exampleHasKeyTrueWithKey()