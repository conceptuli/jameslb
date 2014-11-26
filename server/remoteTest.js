// Create a collection of remote objects.
var remotes = require('strong-remoting').create();

// Export a `user` object.
var user = remotes.exports.user = {
  greet: function (str, callback) {
    callback(null, str + ' world');
  }
};

// Share the `greet` method.
user.greet.shared = true;
user.greet.accepts = { arg: 'str' };
user.greet.returns = { arg: 'msg' };

// Expose it over the REST transport.
require('http')
  .createServer(remotes.handler('rest'))
  .listen(3000);
