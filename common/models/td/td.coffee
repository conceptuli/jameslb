




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
      phrase: 'phrase'
      type: 'type'

    @classifier.insert
      type: 'test'
    db.saveToDisk()
    console.log 'ok'
