loopback = require('loopback')
app = loopback()
loki  = require 'lokijs'
fs = require 'fs'
path = require 'path'

BrainDb = (dbName) ->
  dbName = new loki "#{dbName}.json"
  dbName.saveToDisk()
  dbName.on 'addCollection', (collectionName)->
    @.createCollection collectionName



dbName = 'foo'
console.log db = new BrainDb dbName
db.addCollection string = 'test'


###

dbName = footon "#{dbName}"
dbName.on 'ready', ->
  console.log 'ready'
###
