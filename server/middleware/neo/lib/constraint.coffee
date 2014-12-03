BrainDB = require('seraph')('http://localhost:7474')

constraint =->
  console.log 'to create constraint add dot create with label and key'


constraint.create = (label, key) ->
  if label.length <1 then throw 'missing constraint'
  if key.length <1 then throw 'missing key'

  else
    @label = label.toUpperCase()
    BrainDB.constraints.uniqueness.createIfNone @label, key, (err, constraint) ->
      if err then console.log err
      else console.log constraint
      return constraint

constraint.drop = (label, key) ->
  @label = label.toUpperCase()
  BrainDB.constraints.uniqueness.drop @label, key, (err) ->
    if err then console.log err
    else console.log 'ok'


constraint.listOnKey = (label, key) ->
  @label = label.toUpperCase()
  BrainDB.constraints.uniqueness.list @label, key, (err, constraints) ->
    if err then console.log err
    else console.log constraints
    return constraints

constraint.listOnLabel = (label) ->
  @label = label.toUpperCase()
  BrainDB.constraints.list @label, (err, constraints) ->
    if err then console.log err
    else console.log constraints
    return constraints

module.exports = constraint
