/**
 * learnings:
 * 
 * 1. i learned how mock a module which is used by another module. in this example i have mocked module 'mymodule' which is used
 *    by another module 'mymoduleuser'. here i my intension is unit testing some funtions in mymoduleuser not the mymodule. but
 *    mymoduleuser is dependent of mymodule. therefore the results of functions of mymoduleuser will be influenced by mymodule which
 *    is not the intention for unit test. in this scenario mocks are useful. mock the behaviour of mymodule so that mymodule behave exactly
 *    how i want during unit test of mymodule.
 * 
 *  Example: Let's say i am unit testing a function that perform some task on data fetched from database. i can mock that perticular fetch method
 *           an return some specific result from it. now the actual function, the function i am testing, will perform its tasks and give the result
 *           which i can easily test. because i know before hand on what data the function is performing.
 */

const mymodule = require('./mymodule')

const { isDBDisconnected, saveInDatabase } = require('./mymoduleuser')


// Mock the DB class
jest.mock('./mymodule', () => {

    return {

        // i will mock the necessary classes functions variable etc.
        // rest of the content from the module will remain as it is.
        // the following like simply add all the module content first
        
        ...jest.requireActual('./mymodule'),

        // Mock DB.
        //  create method returns the mock DB instance
        //  and save is a jest mock function

        DB: {
            create: function() { return this },

            save: jest.fn(),

            isConnected: jest.fn()
        },
    };
});

const db = mymodule.DB.create()

// test example of mock resolve of an async function or a function that returns Promise

test('save must fail', async () => {
    
    db.save.mockResolvedValue(3)

    expect(saveInDatabase()).rejects.toThrow(/not saved/);
})

test('save must pass', async () => {
    db.save.mockResolvedValue(2)

    expect(saveInDatabase()).resolves.toBe(true);
})

test('save must pass with false', async () => {
    db.save.mockResolvedValue(0)

    expect(saveInDatabase()).resolves.toBe(false);
})

// example to mock return value from a non-asyn function or a function that does not returns Promise

test('when connected', () => {
    db.isConnected.mockReturnValue(true)

    expect(isDBDisconnected()).toBeFalsy()
})

test('when disconnected', () => {
    db.isConnected.mockReturnValue(false)

    expect(isDBDisconnected()).toBeTruthy()
})
