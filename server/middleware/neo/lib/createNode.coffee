

class CreateType
  constructor: (@type, properties={}) ->
    @label = @type.toUpperCase()
    type =
      typeName: @type
      type: @label
      properties: {}
    return type

class Properties
  constructor: (type) ->
    console.log type
    @type = type
  addProp: (k,v) ->
    @type.properties[k] = v



x = new CreateType 'foo'
console.log x
y = new Properties x
y.addProp 'x','d'
console.log y
###
CreateGraphNode = (type, props) ->
  @type = new CreateType "#{type}"
  x = new Properties @type
  for k,v of props
    x.addProp k,v


props =
  name: 'brian'
  age: '12'###


###foo = CreateGraphNode 'foo', props###


###Foo = new CreateType 'foo'
console.log Foo

Bar = new Properties Foo
Bar.addProp 'foo',3
Bar.addProp 'bar','Bb'###
