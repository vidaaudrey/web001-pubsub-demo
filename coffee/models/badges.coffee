#
redis = require '../libs/redis'
broadcast = require '../libs/broadcast'


exports.save = (badges,callback) -> 
    return callback(null, null) if not badges.length 
    badge = badges.pop()
    redis.lpush 'badges', JSON.stringify(badge), (err) ->
        if err then callback(err, null) else exports.save(badges, callback)


exports.trim = ->
    redis.ltrim 'badges', 0, 9


#send badges to broadcaster / publisher
exports.send = (badges, callback) ->
    broadcast.send(badge) for  badge in badges 
    callback null, null

#get trimmed badges from redis 
exports.get = (callback) ->
    redis.lrange 'badges', 0, -1, (err, data) ->
        return callback(err, null) if err 
        callback null, data.map(JSON.parse)
