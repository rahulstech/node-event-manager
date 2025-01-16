// To run all the tests inside jest-tutorial, use command: `npx jest jest-tutorial`

// no explicit import of jest is required, it is available globally

// test function takes test description as first argument and a function as second argument to perform the test


// simple test 

test('adds 1 + 2 to equal 3', () => {
    expect(1 + 2) // use expect to generate the result to be tested or function reference to be tested
    .toBe(3) // methods start with `to` are matchers
});


// test exception

test('test throw', () => {
    function testThrow() {
        throw new Error('test throw');
    }
    expect(testThrow).toThrow(); // Simple check it throws error or not

    // expect(testThrow).toThrow(Error); // Check the error type

    // expect(testThrow).toThrow('test throw');  // Match the error message or by RegExp
})

// example of doing configuration before each test using beforeEach
// there is afterEach to do cleanup after each test

let sharedValue = 0

beforeEach(() => {
    console.log(` starting test and sharedValue: ${sharedValue}`)
    sharedValue = 24
})

afterEach(() => {
    console.log(` test complete and sharedValue: ${sharedValue}; doing cleanup`)
    sharedValue = 0
})

test('sharedValue + 4 expects 28', () => {
    expect(sharedValue + 4).toBe(28)
})

test('sharedValue - 7 to be 17', () => {
    expect(sharedValue - 7).toBe(17)
})