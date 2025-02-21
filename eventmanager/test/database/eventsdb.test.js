const { captureDBErrorAsync } = require('../../src/database/eventsdb')

async function checkEvenOrThrow(num) {
    if (num%2 === 0) {
        return true
    }
    else {
        throw new Error(`${num} is not even`)
    }
}

describe('captureDBErrorAsync', () => { 
    test('even number test for 10 should resolve', () => {
    
        return expect(captureDBErrorAsync(checkEvenOrThrow(10))).resolves.toBeTruthy()
    })
    
    test('even number test for 11 should reject', () => {
        
        return expect(captureDBErrorAsync(checkEvenOrThrow(11))).rejects.toThrow(expect.objectContaining({
            message: '11 is not even'
        }))
    })
 })

