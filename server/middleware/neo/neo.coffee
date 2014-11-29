BrainDB = require('seraph')('http://localhost:7474')
node = require('./lib/createNode.coffee')


foo = new node 'foo', properties={name:'bob', age:'12'}


bar = new node 'bar', properties =
  name: 'ben'
  age:'12'

console.log foo

console.log bar
