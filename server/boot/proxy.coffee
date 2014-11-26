http = require 'http'
loopback = require 'loopback'
request = require 'request'
querystring = require 'querystring'
extractValues = require 'extract-values'

app = loopback()

module.exports = (app) ->
  app.use '/tts', (req, res)->
    phrase = req.query.phrase

    formData =
      MyLanguages: 'sonid9'
      MySelectedVoice: 'Graham'
      MyTextForTTS: "#{phrase}"
      SendToVaaS: ''

    options =
      headers:
        ' content-type': 'Content-type: application/x-www-form-urlencoded\r\n'


    request.post
      url: 'http://www.acapela-group.com/demo-tts/DemoHTML5Form_V2.php'
      headers: options.headers
      form: formData
      , (error, response, body) ->
        body = extractValues JSON.stringify(response), "var myPhpVar = '{link}\';"
        bodyLink = body.link



        res.json
          "speak": bodyLink
