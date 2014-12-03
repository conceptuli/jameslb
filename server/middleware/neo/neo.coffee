###
BrainDB = require('seraph')('http://localhost:7474')
node = require('./lib/createNode.coffee')
read = require('./lib/readNode.coffee')
make = require './lib/makeNode.coffee'
save = require './lib/saveNode.coffee'
###

###
s = require 'seraph'



findNode = (predicate, label) ->

  @predicate = predicate
  label = label.toUpperCase()

  find = BrainDB.find predicate, label, (err, objs) ->
    if err then throw err

predicate =
  sex:'male'

label = 'PERSON'
console.log x = findNode predicate, label

###
cypher = require('cypher-stream')("http://localhost:7474")
name1 = 'Bill'
label1 = 'MAN'
ss = "MERGE (n:#{label1} {name:'#{name1}'}) return n"
a = cypher(ss).on 'data',(result) -> console.log result

b = cypher("MERGE (n:MAN {name:'Bob'}) return n").on 'data',(result) -> console.log result

