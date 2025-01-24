/**
 * 
 * ModelName.update( values, options ): update is the static method to update with where clause. values parameter takes the new values
 * options main contain a where. it returns a number denoting how many rows affacted after the successful update operation
 * 
 * modelInstance.update( values ): this update is an instance method to update that perticular instance. so no where caluse.
 * on success update returns the same instance with updated values
 */

const { Sequelize, DataTypes } = require('sequelize')

const sequelize = new Sequelize('sqlite::memory:')

const Contact = sequelize.define('Contact', {
    firstname: {
        type: DataTypes.STRING,
        allowNull: false
    },

    lastname: DataTypes.STRING,

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
            console.log('data: ', contact, ' model: ', model.toJSON())
        }
        catch(err) {
            console.log(err)
        }
    }
}

async function runTest() {

    const tests = [
        update_addLastname, update_addEmail, update_changeFirstname, update_setPhone_null
    ]

    for( const test of tests) {
        try {
            await test()
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
    const contact = await Contact.findOne({ where: { id }})

    console.log(`update: id=${id} contact=`, contact.toJSON())

    const result = await contact.update({ email:  'daniel.brown@example.com' })

    console.log(` result=`, result.toJSON())
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