
/**
 * This is an example of creating a custom transport for winston.
 * This transport does nothing. During running tests, you may not want to log anything.
 * But winston warns you if you don't have any transports. So, you can use this transport to avoid that warning.
 */
const Transport = require('winston-transport');
const winston = require('winston');

class CustomTransport extends Transport {
    constructor() {
        super({});
    }

    log(info, callback) {
        // Do nothing
        setImmediate(() => {
            this.emit('logged', info);
        });

        callback();
    }
}

const logger = winston.createLogger({
    transports: [new CustomTransport()]
});

logger.info('Hello, world!');