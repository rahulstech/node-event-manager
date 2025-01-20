const joi = require('joi')

const schema = joi.object({
    a: joi.string().custom(( value, handlers ) => {
        if (value === '') {
            handlers.error('myerror', { reason: 'a is empty'})
        }

        return value+' modified'
    })
})

const compiled = joi.compile(schema).messages({
    'myerror': "{{#reason}}"
})

const dataInvalid = { a: '' }

const dataValid = { a: 'hello' }

const testData = [ dataInvalid, dataValid ]

testData.forEach( data => {
    const { value, error } = compiled.validate(data)

    if (error) {
        console.log('data: ', data,' error: ', error)
    }
    else {
        console.log('data: ', data,' value: ', value)
    }
})