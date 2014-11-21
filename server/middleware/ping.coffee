loopback= require('loopback')
boot = require('loopback-boot')

app = module.exports = loopback()
boot(app, __dirname)

module.exports = (boot) ->
  app.get '/ping', (req,res) ->
    res.send 'pong bitches!'

