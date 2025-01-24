
const runAsyncTests = async (tests, errorCallback =  null) => {

    for(const { name, test } of tests) {
        try {
            await test()
        }
        catch(err) {
            if (!errorCallback) {
                console.log(`test ${name} failed`, err)
            }
            else {
                errorCallback(err, name)
            }
        }
    }
}


const insertMultipleDataData = async (model, data, errorCallback = null) => {
    for (const d of data) {
        try {
            await model.create(d)
        }
        catch(err) {
            if (!errorCallback) {
                console.log(err)
            }
            else {
                errorCallback(err)
            }
        }
    }
}

module.exports = {
    insertMultipleDataData, 
    runAsyncTests
}