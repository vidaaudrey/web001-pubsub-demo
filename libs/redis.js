// Generated by CoffeeScript 1.9.3
(function() {
  var client, redis;

  redis = require('redis');

  client = redis.createClient();

  client.on('error', function(err) {
    throw err;
  });

  module.exports = client;

}).call(this);
