#
redis = require '../libs/redis'


exports.save = (badges,callback) -> 
    return callback(null, null) if not badges.length 
    badge = badges.pop()
    redis.lpush 'badges', JSON.stringify(badge), (err) ->
        if err then callback(err, null) else exports.save(badges, callback)