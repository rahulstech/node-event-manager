/**
 * learning:
 * 
 * 1. node module caching: node modoules are cached on first load and any next require of module node reutrns the cached module if available in cache otherwise reloads.
 * node clears module cache when application shuts down. otherwise one has to remove the cache explicityly using
 * 
 * delete require.cache[ require.resolve('/path/to/module/name.js') ]
 * 
 */

// require the module simplemodule. node caches the module, if found, for later use

const modules1 = require('./simplemodule')

console.log('module1: ', modules1.now) // TEST 1: note the 'now' value

// uncomment the following line to explicitly remove the module simplemodule form the node cache
// 

// delete require.cache[ require.resolve('./modules') ]

// require the module simmplemodule again. if the cache is not cleared then cached simplemodule will be returned
// if cached removed then simplemodule is reloaded
const modules2 = require('./simplemodule')

console.log('module2: ', modules2.now) // TEST 2 : note the 'now' value

// if TEST 1 and TEST 2 now value are same the cached module is used
// if                                 different the module is removed from cached and reloaded