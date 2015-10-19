// Generated by CoffeeScript 1.9.3
(function() {
  var app, badges, express;

  express = require('express');

  app = express();

  badges = require('./controllers/badges');

  app.use(express.json());

  app.get('/', function(req, res) {
    return res.send('Hello world');
  });

  app.post('/', function(req, res) {
    return res.send('Hello world');
  });

  app.listen(8000);

}).call(this);
