###
Send badges to model to be saved 
###
_ = require 'underscore'
model = require '../models/badges'

module.exports.save = (req, res, next) ->
    badges = _.clone req.body
    model.save badges, (err) ->
        if err then res.json(503, {error: true}) else next()

# Send badges to pubsub socket in model 
module.exports.send = (req, res, next) ->
    next()