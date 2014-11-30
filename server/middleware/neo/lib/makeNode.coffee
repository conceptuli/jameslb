BrainDB = require('seraph')('http://localhost:7474')
node = require('./createNode.coffee')




### makeNode accepts properties, - ":Type" needs to be set as "properties.type" ###
makeNode =(properties={}) ->
 new node properties


module.exports = makeNode




