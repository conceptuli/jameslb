BrainDB = require('seraph')('http://localhost:7474')
node = require('./createNode.coffee')
s = require 'seraph'



readNode = (nodeId) ->
  node = {}
  node.id = nodeId
  BrainDB.read node.id, (err, node) ->
    if not err then
    console.log node
  return node


readNode.where = (nodeId, nodePropVal) ->
  node = {}
  node.id = nodeId
  BrainDB.read node.id, nodePropVal, (err, answer) ->
    nodeJSON = {
      answer
    }
    console.log nodeJSON
  return  nodeJSON


module.exports = readNode
