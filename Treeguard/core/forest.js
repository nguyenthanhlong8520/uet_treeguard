const pool = require('../database/index');

function forest() {};

forest.prototype = {
    create : function(body, callback) 
    {
        // this array will contain the values of the fields.
        var bind = [];  
        for(prop in body){
            bind.push(body[prop]);
        }
        // prepare the sql query
        let sql = `INSERT INTO forest(name, district, town, province, latitude, longtitude, size) VALUES (?, ?, ?, ?, ?, ?, ?)`;

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

module.exports = forest;