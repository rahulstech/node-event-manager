const joi = require('joi')

const schema = joi.object({

    // validate against date time format YYYY-MM-DD HH:mm => HH 24 hour format
    // NOTE: following regex does not check the valid range. for example: HH may 36, which is invalid, but it's passed
    join: joi.string()
            .regex(/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$/), 

    name: joi.string()
            .required(), // required flag ensures that a string is not empty
})

const { error, value } = schema.validate({ name: '', join: '2023-05-16 14:30'})

// error expected

if (error) {
    console.log('error', error)
}
else {
    console.log('pass: ', value)
}