module.exports = (Say) ->
  babble = require 'babble'
  james = babble.babbler 'james'
  user = babble.babbler 'user'
  sayThis = require 'say-this'

  Say.hello = (msg, cb) ->
    james.listen /hi|hello/
    .tell ->
      "Good morning!"

    user.ask 'james', msg, (greeting) ->
      cb null, greeting

  Say.remoteMethod "hello",
    accepts:
      arg: 'msg'
      type: 'string'

    returns:
      arg: 'greeting'
      type: 'string'


  Say.speak = (msg, data) ->
    console.log msg
    james.listen /hi|hello|good morning/
    .tell ->
      "good morning sir... How are you? "

    user.ask 'james', msg, (greeting) ->
      request = require 'request'
      request.get "http://localhost:3000/tts?phrase=#{greeting}", (error, response, body) ->
        data null, body



  Say.remoteMethod "speak",
    http: {verb: 'get'},
    accepts:
      arg: 'msg'
      type: 'string'

    returns:
      arg: 'data'
      type: 'object'
