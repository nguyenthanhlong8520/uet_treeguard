const express = require('express')
const app = express()

var server = require('http').createServer(app);
var io = require("socket.io")(server);

io.on('connection', function connection(socket) { //Bắt sự kiện một client kết nối đến server
    console.log('Have new client')
});

app.get('/', (req, res) => res.send('Hello World!'))

server.listen(3000, () => console.log(`Lisening on port :3000`))