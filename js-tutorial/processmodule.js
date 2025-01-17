/**
 * learnigs:
 * 
 * 1. best way to handle abnormal system exiting is
 * 
 *      1. listen for 'exit' as well as signal events, 
 *      2. then release resources properly
 */

process.on('uncaughtException', (err, origin ) => {

    // when this listener is attached, the uncaught exception does not exits the process itself
    // as there is another task is in progress, in this case the setTimeout task

    console.log(`the exception is not caught by the app: origin ${origin}`)
    console.log(err)
})

process.on('unhandledRejection', (reason, promise) => {
    // when this listener is attached, any unhandled promise rejection will not exit
    // and handle that rejection here. unhandled rejection means no .catch() is attached
    // to the promised or Promise is not called inside try{}catch{} 
    console.log(`the rejection is not handled by the app ${reason}: origin ${promise}`)
})

process.on('beforeExit', code => {
    // this listener is called just before the exit.
    // NOTE: this event will not be triggered if there is any uncaught exception 
    //      or unhandled promise rejection. 
    console.log(`called before exit with code ${code}`)
})

process.on('exit', code => {
    // this listener is called when process has stopped running.
    // don't do any heavy task here. if you need to auto restart the process
    // then simply send a message to parent process from here.

    // NOTE1: this event is always triggered even there is any uncause exception or
    //       any unhandled promised rejection. hence do release resources here.

    // NOTE2: this event is never called when process is killed using process.kill(pid, signal),
    //        or process.abort() or a parent process stops it manually.
    //        But it will be called with exiting via process.exit(code)
    console.log(`called on exit with code ${code}`)
})

function handleSignalEvent(signal) {
    console.log(`an signal event occurred ${signal}`)
}

setTimeout(() => { console.log(`called after some time`)}, 2000);

// Uncomment the following line to test uncaughtException

// throw new Error('this is first error')

// Uncomment the follwoing line to test unhandledRejection

// (() => Promise.reject(new Error('an error occurred in promise')))()



// NOTE: can not attach a lister for event SIGKILL. I can send this signal using process.kill(pid, 'SIGKILL')
// attaching listener for this signal event will throw an exception

// process.on('SIGKILL', handleSignalEvent) 

// on windows, docker etc. some signal events are not supported. therefore attaching listener for that signal event
// will throw EINVAL error.
// when attaching listener for signal event that does not exists, like instead of SIGINT misspelled SIGINTR, then node
// will also throw EINVAL error.

// NOTE: SIGINT SIGTERM SIGUP etc event will not be triggered if process.exit(code) is used to exit. then 'exit' event is triggered.

process.on('SIGINT', handleSignalEvent)

process.on('SIGTERM', handleSignalEvent)

// process.kill(process.pid, 'SIGINT')

// process.exit()

// process.abort()