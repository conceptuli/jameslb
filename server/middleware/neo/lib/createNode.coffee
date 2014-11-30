

class CreateType
  constructor: (@type, properties={}) ->
    @label = @type.toUpperCase()
    @type.properties = properties
    @type = {
      typeName: @type
      label: @label
      properties
    }
    @rels

    return @type


class Properties
  constructor: (@type) ->
    console.log type
    @type = type
  addProp: (k,v) ->
    @type.properties[k] = v




class Create
  constructor: (@properties={}) ->


    @type = properties.type
    @uuid = properties.uuid = require('node-uuid').v4()
    @graphNode = new CreateType @type, properties

  addProperty: (k,v) ->
    @type.properties[k]=v

module.exports = Create
###

X = new Create 'foo', properties={name:'ff', age: '12'}
console.log X
###


###
class CreateType2
  constructor: (@type, properties={}) ->
    @label = @type.toUpperCase()
    type =
      typeName: @type
      label: @label
      properties: {}
    return type
    @addProp= (k,v, type) ->
      @type = type
      y = @type.properties[k] = v



x = new CreateType2 'foo', properties = {}
console.log x
x.addProp 'd', 'd'
console.log x



CreateGraphNode = (type, props) ->
  @type = new CreateType "#{type}"
  x = new Properties @type
  for k,v of props
    x.addProp k,v


props =
  name: 'brian'
  age: '12'

foo = CreateGraphNode 'foo', props


Foo = new CreateType 'foo'
console.log Foo

Bar = new Properties Foo
Bar.addProp 'foo',3
Bar.addProp 'bar','Bb'###
