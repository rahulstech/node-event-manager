/**
 * 
 * ModelName.update( values, options ): update is the static method to update with where clause. values parameter takes the new values
 * options main contain a where. it returns an array of two elements: first element is number denoting how many rows affacted after the successful update operation
 * 
 * modelInstance.update( values, options ): this update is an instance method to update that perticular instance. so no where caluse.
 * on success update returns the same instance with updated values.
 * 
 * Note: both the options accepts fields array. fields is an array of strings. each field element is the name of the model attribute not the database column name.
 * when fields is set then only those fields will be updated. for exmaple:
 * 
 * fields: [ 'firstname', 'lastname']
 * values = { lastname: 'Brown', email: 'newmail@email.com' }
 * 
 * then only lastname is updated email is ignored.
 */

const { Sequelize, DataTypes } = require('sequelize')

const sequelize = new Sequelize('sqlite::memory:')

const Contact = sequelize.define('Contact', {
    firstname: {
        field: 'first_name',
        type: DataTypes.STRING,
        allowNull: false
    },

    lastname: {
        field: 'last_name',
        type: DataTypes.STRING,
    },

    phone: {
        type: DataTypes.STRING,
        allowNull: false,
    },

    email: DataTypes.STRING,

}, { timestamps: false });

(async () => {

    await sequelize.authenticate()

    await sequelize.sync()

    await addContacts()

    await runTest()
})();

/**
 * Name: Emily Johnson
Phone: +1 (202) 555-1234
Email: emily.johnson@example.com

Name: Michael Smith
Phone: +1 (310) 555-5678
Email: michael.smith@example.com

Name: Sophia Martinez
Phone: +1 (646) 555-7890
Email: sophia.martinez@example.com

Name: Daniel Brown
Phone: +1 (415) 555-2345
Email: daniel.brown@example.com
 */

async function addContacts() {
    const contacts = [
        { firstname: 'Emile', lastname: 'Johnson', phone: '+1 (310) 555-5678', email: 'emily.johnson@example.com' },
        { firstname: 'Michael', phone: '+1 (310) 555-5678' },
        { firstname: 'Sophia', lastname: 'Martinez', phone: '+1 (310) 555-5678', email: 'emily.johnson@example.com' },
        { firstname: 'Daniel', lastname: 'Brown', phone: '+1 (310) 555-5678', }
    ]

    for(const contact of contacts) {
        try {
            const model = await Contact.create(contact)
            // console.log('data: ', contact, ' model: ', model.toJSON())
        }
        catch(err) {
            console.log(err)
        }
    }
}

async function runTest() {

    const tests = [
        update_addLastname, update_addEmail, update_changeFirstname, update_setPhone_null, update_onlyFields, 
        update_undefinedValue
    ]

    for( const test of tests) {
        try {
            await test()
            console.log("====================================================")
        }
        catch(err) {
            console.log(err)
        }
    }
}

async function update_addLastname() {
    const values = { lastname: 'Smith' }
    const id = 2
    const result = await Contact.update(values, {
        where: {
            id
        }
    })

    console.log('updated contact: values= ', values, ' id=', id, ' result: ', result)
}

async function update_addEmail() {
    const id = 4

    // contact is a Contact model object not plain js object.
    const contact = await Contact.findOne({ 

        // if i uncomment the following property then result will be plain js object.
        // raw is by default false means a Model instance will be retured

        // raw: true,

        where: { id }
    })

    // to reuse the older state i stored the value. because after update i can not access the older values from the instance
    const oldContact = { ...contact.toJSON() }

    console.log(`update: id=${id} contact=`, oldContact )

    // to call the update() instance method i need a Model instance, so if i use raw = true then i can not do the following.
    // I have to then use the static update() method of Contact 
    const result = await contact.update({ email:  'daniel.brown@example.com' })


    // result is the same model instance and model toJSON() method will return plain js object containing attributes values only
    // use the result or the contact instance is same
    console.log(` old: `, oldContact, ` updated: `, result.toJSON())
}

async function update_changeFirstname() {
    const values = { firstname: 'Emily' }
    const id = 1
    const result = await Contact.update(values, {
        where: {
            id
        }
    })

    console.log('updated contact: values= ', values, ' id=', id, ' result: ', result)
}

async function update_setPhone_null() {
    const values = { phone: null }
    const id = 3
    const result = await Contact.update(values, {
        where: {
            id
        }
    })

    console.log('updated contact: values= ', values, ' id=', id, ' result: ', result)
}

async function update_onlyFields() {
    const values = { lastname: 'Smith', email: 'michael.smith@example.com' }
    const id = 2
    const fields =  ['firstname', 'lastname']

    /**
     * i can do the same thing using update() of instance. that update method also takes an optional options parameter
     * where i can set the fields too.
     */
    const [ count ] = await Contact.update(values, {
        fields,
        where: {
            id
        }
    })

    if (count === 1) {
        const contact = await Contact.findOne({ where: { id } })
        console.log('updated contact: values= ', values, ' id=', id, ' fields: ', fields ,' after update: ', contact.toJSON())
    }
    else {
        console.log('contact not updated')
    }
}

async function update_undefinedValue() {
    /**
     * when a value is undefined then it is not updated. like here the contact with id 3 already has an email and updating email
     * to undefined. but this updated will not execute. 
     */
    const id = 3
    const values = { email:  undefined }

    const contact = await Contact.findOne({ where : { id }})

    const oldContact = { ...contact.toJSON() }

    await contact.update(values)

    console.log('update: id=', id, ' values=', values, ' oldContact: ', oldContact, '  updated contact=', contact.toJSON())
}