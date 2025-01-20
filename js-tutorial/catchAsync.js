/**
 * learning:
 * 
 * 1. catchAsync function is used when i have similar way to handle error produced. for example: in express app i want to handle
 *    all the errors sent to global error handler and log error with stack trace. thus i don't have to repeat the try catch block
 *    every where. simply i can wrap the function that performs the actual task, like db operation, in catchAsync and catchAsync will
 *    handle any error if produced by the wrapped function. this ensures the seperation of concern and let me focus on the single
 *    unit of task. how? two concers in the above case are the db operation and the logging with error handelling. 
 *    with catchAsync:
 *      a. db operation concern: by wrapped function
 *      b. error logging and handelling:  by catchAsync
 */

/**
 * catchAsync wraps an async function, passed via arugument, and returns another funtion  that received the actual arguments
 * and call the wrapped function async. the catchAsync returns a function which accepts vararg. thus i can pass any number of
 * arguments to it. it helps wrapping any function accepts any number of  arguments 
 */

const catchAsync = ( fn ) => (...args) => {
    console.log(`i am in a function returned from catchAsync with arg ${args}`)

    fn(...args).then( () => console.log('resolved')).catch(err => console.log(`rejected with: ${err.message}`))
}

const work = catchAsync( async (arg) => {
    if (arg%2 == 0) {
        console.log(`${arg} is even`)
    }
    else {
        throw new Error(`${arg} is not even number`)
    }
})

const work2 = catchAsync(async (a, b) => {
    if (a > b) {
        console.log(`${a} > ${b}`)
    }
    else {
        throw new Error(`a <= b is not accepted; a = ${a} b = ${b}`)
    }
})

work(5)

work(10)

work2(5, 3)

work2(6, 6)

work2(3, 8)