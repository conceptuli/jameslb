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
    @properties =
      method: 'CREATE'
      type: 'Thing'
      params: {}
      uuid: uuid.v4()

  type: (newType) ->
    @properties.type = newType
    @

  params: (newParams={}) ->

    param = for k,v of newParams
      "#{k}:\"#{v}\""
    pt = param.join ", "



    @properties.params = pt.toString()
    @

  method: (newMethod) ->
    @properties.method = newMethod
    @

  build: ->
    console.log @properties
    method = @properties.method
    label = @properties.type
    params = @properties.params
    id = randomString(4, 'abcdefghijklmnopqrstuvwxyz')
    console.log "#{method} (#{id}:#{label} {#{params}}) return #{id}"
    @



x = new Node().params({name:'bird2'})
console.log x.build()


y = new Node().params({name:'bird'})
console.log y.build()
