# 'user strict';

express = require 'express'
app = express()
badges = require './controllers/badges'

app.use express.json()

#routes
app.get '/', (req, res) ->
    res.send 'Hello world'

app.post '/', (req, res) ->
    res.send 'Hello world'

app.listen 8000