const pool = require('../database/index');

function Devices_mess() {};

Devices_mess.prototype = {
    create : function(body, callback) 
    {
        // this array will contain the values of the fields.
        var bind = [];  
        for(prop in body){
            bind.push(body[prop]);
        }
        // prepare the sql query
        let sql = `INSERT INTO device_messages(id, is_stroked, is_removed, is_fire, power) VALUES (?, ?, ?, ?, ?)`;

        pool.query(sql, bind, function(err, result) {
            if(err) {
                throw err;
                //callback(false);
            }
            // return the last inserted id. if there is no error
            callback(true);
        });
    },
}

module.exports = Devices_mess;