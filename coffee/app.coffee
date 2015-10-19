# 'user strict';

express = require 'express'
app = express()
badges = require './controllers/badges'

app.use express.json()

#routes
app.get '/', (req, res) ->
    res.send 'Hello world'

app.post '/', badges.save, badges.send, (req, res) ->
    res.send 'Hello send\n'

app.listen 8000