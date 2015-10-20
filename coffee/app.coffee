# 'user strict';

express = require 'express'
app = express()
badges = require './controllers/badges'

app.use express.json()

#routes
app.get '/', (req, res) ->
    res.send 'Hello world'

app.get '/badges', badges.get

app.post '/', badges.save, badges.send, (req, res) ->
    res.send 'Hello send\n'

app.listen 8000, ()->
    console.log 'Listening to port 8000'