const { resolve, join } = require('node:path')

const { NODE_ENV, DEV_DB_FILE, PROD_DB_FILE } = process.env

const storage_base = resolve(__dirname, '../../../datastore')

const config = {
    dialect: 'sqlite'
}

if (NODE_ENV === 'production') {
    config['storage'] = join(storage_base, PROD_DB_FILE)
}
else if (NODE_ENV === 'development') {
    config['storage'] = join(storage_base, DEV_DB_FILE)
}
else {
    config['storage'] = ':memory:'
}

module.exports = config