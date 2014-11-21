loopback= require('loopback')
boot = require('loopback-boot')

app= loopback()
boot(app, __dirname)
http = require 'http'

RED = require 'node-red'

server = http.createServer(app)

settings =
  httpAdminRoot: '/extend'
  httpNodeRoot: 'red'
  userDir:'/home/brian/WebstormProjects/jameslb/noderedHome'
  functionGlobalContext: {}


RED.init server,settings

app.use settings.httpAdminRoot, RED.httpAdmin

app.use settings.httpNodeRoot, RED.httpNode
server.listen(4000)
RED.start()


