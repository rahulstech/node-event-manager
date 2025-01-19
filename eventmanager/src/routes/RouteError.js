class RouteError extends Error {

    constructor(reason) {
        super()

        this.message = reason
        this.name = this.constructor.name
    }
}

module.exports = {
    RouteError
}