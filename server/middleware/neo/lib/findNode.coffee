BrainDB = require('seraph')('http://localhost:7474')


findNode = ->
  console.log 'to use this, at least include a partial object definition.  To narrow the search, you have the ability to
include additional params and execute with findNode.refine.  Basic usage works with findNode.all'

findNode.all = (predicate={}) ->
  BrainDB.find predicate, (err, results) ->
    if err then throw err
    else console.log results


module.exports findNode
