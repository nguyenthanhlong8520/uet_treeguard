const express = require('express')
var app = express()

const port = 3000

// create application/json parser
var bodyParser = require('body-parser')
var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.get('/', (req, res, next) => {
    return res.send('Hello World')
})

// POST /login gets urlencoded bodies
app.post('/login', urlencodedParser, function (req, res) {
  res.send('welcome, ' + req.body.username)
})

// POST /api/users gets JSON bodies
app.post('/api/users', jsonParser, function (req, res) {
  // create user in req.body
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

module.exports = app;