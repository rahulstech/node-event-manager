class DB {

    static create() {
        return new DB()
    }

    constructor() {
        this.connected = true
    }

    async save() {
        console.log('save complete')
        return Math.floor(Math.random() * 90) + 10 // returns the id
    }

    isConnected() {
        return this.connected
    }

    close() {
        this.connected = false
    }
}

module.exports = { DB }