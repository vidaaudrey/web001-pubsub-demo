// Generated by CoffeeScript 1.9.3
(function() {
  var broadcast, redis;

  redis = require('../libs/redis');

  broadcast = require('../libs/broadcast');

  exports.save = function(badges, callback) {
    var badge;
    if (!badges.length) {
      return callback(null, null);
    }
    badge = badges.pop();
    return redis.lpush('badges', JSON.stringify(badge), function(err) {
      if (err) {
        return callback(err, null);
      } else {
        return exports.save(badges, callback);
      }
    });
  };

  exports.trim = function() {
    return redis.ltrim('badges', 0, 9);
  };

  exports.send = function(badges, callback) {
    var badge, i, len;
    for (i = 0, len = badges.length; i < len; i++) {
      badge = badges[i];
      broadcast.send(badge);
    }
    return callback(null, null);
  };

  exports.get = function(callback) {
    return redis.lrange('badges', 0, -1, function(err, data) {
      if (err) {
        return callback(err, null);
      }
      return callback(null, data.map(JSON.parse));
    });
  };

}).call(this);
