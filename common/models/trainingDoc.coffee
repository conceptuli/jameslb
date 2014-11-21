natural = require 'natural'
loki = require 'lokijs'
path = require 'path'
db = new loki 'brain.json'

console.log db
db.saveToDisk()
db.close()

class Trainer
  constructor: (@classifier) ->
    foo = db.addCollection "#{@classifier}"
    foo.insert
      name: 'test'
      phrase: 'this is a test'
      age: 12
    db.saveToDisk()
    foo.data + 'ok'

  addPhrase: (@classifier, phrase, type) ->
    bar = db.addCollection "#{@classifier}"
    @classifier.insert
      phrase: phrase
      type: type

    @classifier.insert
      type: 'test'
    db.saveToDisk()
    console.log 'ok'



module.exports = (trainingDoc) ->

  trainingDoc.createCollection = (classifier, data) ->

    try
      console.log classifier
      new Trainer classifier
      data null, 'ok'

    catch error
      console.log error




  trainingDoc.remoteMethod "createCollection",
    http: {verb: 'get'},
    accepts:
      arg: 'classifier',
      type: 'string'


    returns:
      arg: 'data'
      type: 'object'

  trainingDoc.addPhrase = (classifier, phrase, type, data) ->

    try

      classifier.addPhrase(phrase, type)


    catch error
      console.log error

    finally
      data null, 'ok'

  trainingDoc.remoteMethod "addPhrase",
    http: {verb: 'post'},
    accepts:[
      {
        arg: 'classifier'
        type: 'string'
      },
      {
        arg: 'phrase',
        type: 'string'
      }
      {
        arg: 'type',
        type: 'string'
      }
    ]
    returns:
      arg: 'data'
      type: 'object'
