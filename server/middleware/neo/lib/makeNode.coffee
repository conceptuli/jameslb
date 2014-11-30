


g = (properties={}, @data) =>
  @data = new node properties

  @data

### makeNode accepts properties, - ":Type" needs to be set as "properties.type" ###
makeNode =(properties={}) -> g properties


module.exports = makeNode
