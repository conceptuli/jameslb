log = console.log
###

BrainDB = require('seraph')('http://localhost:7474')
ev = require 'extract-values'
cypher = ''

cs = []
go = BrainDB.query cypher, id, (err, result) ->
  if err then throw err
  else result




phrase = ''
readPhrase = (@phrase, vars) =>
  varBase = ev(@phrase, "")
###

nlp = require './peTest'
log nlp.getParsedTree('where is John')
