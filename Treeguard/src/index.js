const express = require('express');
const path = require('path');
var bodyParser = require('body-parser');
const pageRouter = require('./routes.js');
const app = express();

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next()
});

// for body parser. to collect data that sent from the client.
app.use(express.urlencoded( { extended : false}));

// Serve static files. CSS, Images, JS files ... etc
app.use(express.static(path.join(__dirname, 'public')));
app.use(bodyParser.json());


// Routers
app.use('/', pageRouter);

// Errors => page not found 404
app.use((req, res, next) =>  {
    var err = new Error('Page not found');
    err.status = 404;
    next(err);
})

// Handling errors (send them to the client)
app.use((err, req, res, next) => {
    res.status(err.status || 500);
    res.send(err.message);
});

// Setting up the server
app.listen(3000, () => {
    console.log('Server is running on port 3000...');
});

module.exports = app;