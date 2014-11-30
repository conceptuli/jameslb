makeNode = require './makeNode.coffee'

### saveNode must be called after makeNode - call the newly created object ###
saveNode = (makeNode)->
  BrainDB.save makeNode.graphNode.properties, makeNode.graphNode.label, (err, data) ->
    console.log data

module.exports = saveNode
