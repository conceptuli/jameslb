BrainDB = require('seraph')('http://localhost:7474')
makeNode = require './makeNode.coffee'
uuid = require 'node-uuid'

### saveNode must be called after makeNode - call the newly created object ###
saveNode = (properties = {})->
  label = (properties.type).toUpperCase()
  properties.uuid = uuid.v4()
  BrainDB.save properties, label, (err, data) ->
    console.log data


module.exports = saveNode
###properties =
  type: 'Person'
  sex: 'male'
  age: 12
  isKid: true

saveNode properties###
