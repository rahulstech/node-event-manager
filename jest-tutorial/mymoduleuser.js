const mymodule = require('./mymodule')

const saveInDatabase = async () => {
    const db = mymodule.DB.create();
    const r = await db.save()
    console.log(`r = ${r}`)
    if (r === 2) {
        return true
    } else if (r === 0) {
        return false;
    }
    throw new Error('not saved');
}

const isDBDisconnected = () => {

    const db = mymodule.DB.create()

    return !db.isConnected()
}

module.exports = {
    saveInDatabase, isDBDisconnected
}