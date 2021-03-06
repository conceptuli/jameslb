// Generated by CoffeeScript 1.8.0
(function() {
  var app, extractValues, http, loopback, querystring, request;

  http = require('http');

  loopback = require('loopback');

  request = require('request');

  querystring = require('querystring');

  extractValues = require('extract-values');

  app = loopback();

  module.exports = function(app) {
    return app.use('/tts', function(req, res) {
      var formData, options, phrase;
      phrase = req.query.phrase;
      formData = {
        MyLanguages: 'sonid9',
        MySelectedVoice: 'Graham',
        MyTextForTTS: "" + phrase,
        SendToVaaS: ''
      };
      options = {
        headers: {
          ' content-type': 'Content-type: application/x-www-form-urlencoded\r\n'
        }
      };
      return request.post({
        url: 'http://www.acapela-group.com/demo-tts/DemoHTML5Form_V2.php',
        headers: options.headers,
        form: formData
      }, function(error, response, body) {
        var bodyLink;
        body = extractValues(JSON.stringify(response), "var myPhpVar = '{link}\';");
        bodyLink = body.link;
        return res.json({
          "speak": bodyLink
        });
      });
    });
  };

}).call(this);

//# sourceMappingURL=proxy.js.map
