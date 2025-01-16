// async.test.js

const fetchData = () => {
    return new Promise((resolve) => {
        setTimeout(() => {
            resolve('peanut butter');
        }, 1000);
    });
};

// test async function 
test('the data is peanut butter', async () => {
    const data = await fetchData();
    expect(data).toBe('peanut butter');
});

/**
 * Test if an async function throws error
 */

async function doTaskAsyncAndThrow() {
    throw new Error('this is an error')
}

// First Approach:

test('doTaskAsyncAndThrow', async () => {
    // use async callback for test
    await expect(doTaskAsyncAndThrow()).rejects.toThrow()
})

// Second Approach:

test('doTaskAsyncAndThrow: using return', () => {
    // use 'return' to return from test callback
    return expect(doTaskAsyncAndThrow()).rejects.toThrow()
}) 

/**
 * Test an async function that throws for known cases and does not throws for other cases.
 * The following function throws errow when the argument is not event number. if the number is
 * even it returns string 'even'. i will test the two cases for the function. 
 * first: when i pass 1, a odd number, then i expect it to thow an error
 * second: when i pass 2, a event number, then i expect the return values is 'even'
 */

async function doTaskAsyncMayThrow(x) {
    if (x%2 == 0) {
        return 'even'
    }
    throw new Error(`${x} is not an event number`)
}

// METHOD 1: test using helper function. this approach works but there is straight forward method.
// see METHOD 2

const createRunTask = async (x) => {
    const v = await doTaskAsyncMayThrow(x)
    expect(v).toEqual('even')
}

test('doTaskAsyncButDonotThrow: arg 1', () => {
    return expect(createRunTask(1)).rejects.toThrow()
})

test('doTaskAsyncButDonotThrow: arg 2', () => {
    return expect(createRunTask(2)).resolves.not.toThrow()
})

// METHOD 2: this approach is straight forward and recomended way to test this cases

test('doTaskAsyncButDonotThrow: arg 4 with async test function', () => {
    // use 'resolves' of expect() when test function Promise resolves successfully
    return expect(doTaskAsyncMayThrow(2)).resolves.toEqual('even') 
})

test('doTaskAsyncButDonotThrow: arg 4 with async test function', () => {
    return expect(doTaskAsyncMayThrow(1)).rejects.toThrow()
})