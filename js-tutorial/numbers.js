'use strict';

const types = require('node:util/types')

const text = "-5394"
const value = parseInt(text, 10)

const regex = /^(-)?\d+$/

console.log(regex.test(text))

console.log(value)

console.log(typeof value)

console.log(types.isNumberObject(value))