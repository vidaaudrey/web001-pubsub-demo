axon = require 'axon'
socket = axon.socket 'pub'

socket.bind 3001

# exports.send = socket.send

exports.send = (badge) ->
    socket.send badge