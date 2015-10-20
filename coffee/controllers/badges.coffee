###
Send badges to model to be saved 
###
_ = require 'underscore'
model = require '../models/badges'

exports.save = (req, res, next) ->
    badges = _.clone req.body
    model.save badges, (err) ->
        if err then res.json(503, {error: true}) 
        else 
            next()
            model.trim()

# Send badges to pubsub socket in model 
exports.send = (req, res, next) ->
    badges = _.clone req.body
    model.send badges, (err) ->
        if err then return res.json(503, {error: true}) 
        res.json(200, {error: null})


exports.get = (req, res, next) ->
    model.get (err, data)->
        if err then return res.json(503, {error: true}) 
        res.json(200, data)

