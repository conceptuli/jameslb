BrainDB = require('seraph')('http://localhost:7474')
node = require('./createNode.coffee')
s = require 'seraph'

delNode = (nodeId, nodePropVal) ->
  node = {
    nodePropVal
  }
  BrainDB.delete node.id or np, (err) ->
    if not err then console.log 'that worked '
