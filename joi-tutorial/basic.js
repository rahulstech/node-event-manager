const joi = require('joi')

const schema = joi.object({
    username: joi.string().required(),
    firstname: joi.string().required(),
});

async function exampleValid() {
    try {
        const value = await schema.validateAsync({
            username: 'rahul',
            firstname: 'Rahul'
        }, { abortEarly: false })

        console.log('value: ', value)
    }
    catch(err) {
        console.log('error', JSON.stringify(err, null, 3))
    }
}

async function exampleOnlyUsername() {
    try {
        const value = await schema.validateAsync({
            username: 'rahul',
        }, { abortEarly: false })

        console.log('value: ', value)
    }
    catch(err) {
        console.log('error', JSON.stringify(err, null, 3))
    }
}

async function exampleOnlyFirstname() {
    try {
        const value = await schema.validateAsync({
            firstname: 'Rahul'
        }, { abortEarly: false })

        console.log('value: ', value)
    }
    catch(err) {
        console.log('error', JSON.stringify(err, null, 3))
    }
}

async function exampleNoUsernameNoFirstname() {
    try {
        const value = await schema.validateAsync({ }, { abortEarly: false })
    }
    catch(err) {
        console.log('error', JSON.stringify(err, null, 3))
    }
}

const examples = [ exampleValid, exampleOnlyUsername, exampleOnlyFirstname, exampleNoUsernameNoFirstname ]

examples.forEach( fn => {
    fn()
})