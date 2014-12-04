uuid = require 'node-uuid'
{EventEmitter} = require 'events'
randomString = (len, charSet) ->
  charSet = charSet or "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
  randomString = ""
  i = 0

  while i < len
    randomPoz = Math.floor(Math.random() * charSet.length)
    randomString += charSet.substring(randomPoz, randomPoz + 1)
    i++
  randomString

class Node
  constructor: ->
    require('node-uuid')
    @node =
      method: 'CREATE'
      type: 'Thing'
      properties: {}
      uuid: uuid.v4()


  type: (newType) ->
    node.type = newType
    @

  properties: (props) ->
    @prop = for k,v of props
      "#{k}:\"#{v}\""
    @node.properties = @prop.join ", "
    @

  createMethod: (newMethod) ->
    @node.method = newMethod
    this

###
  build: ->
    console.log @properties
    method = @properties.method
    label = @properties.type
    params = @properties.params
    id = randomString(4, 'abcdefghijklmnopqrstuvwxyz')
    console.log "#{method} (#{id}:#{label} {#{params}}) return #{id}"
    @
###



console.log x = new Node().properties({name:'test', sex:'male'}).createMethod('MERGE')
