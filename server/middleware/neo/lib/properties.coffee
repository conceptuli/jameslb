

class CreateType
  constructor: (@type) ->
    @label = @type.toUpperCase()
    type =
      type: @label
      properties: {}

    return type


###
  CreateGraphNode 'type', properties object

  returns object with label and properties

  ###

class Properties
  constructor: (type) ->
    @type = type

  addProp: (k,v) ->

    console.log @type






module.exports = CreateGraphNode = (type, props={}) ->
  @type = new CreateType "#{type}"
  x = new Properties @type
  for k,v of props
    x.addProp k,v

###
props =
  name: 'brian'
  age: '12'


foo = CreateGraphNode 'foo', props###


###Foo = new CreateType 'foo'
console.log Foo

Bar = new Properties Foo
Bar.addProp 'foo',3
Bar.addProp 'bar','Bb'###

