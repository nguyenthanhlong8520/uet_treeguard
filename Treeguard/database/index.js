const util = require('util');
const { createPool } = require('mysql')

const pool = createPool({
    host: "localhost",
    user: "root",
    password: "long8520",
    database: "uet_treeguard_master",
    connectionLimit: 10
})

pool.getConnection((err, connection) => {
    if(err) 
        console.error("Something went wrong connecting to the database ...");
    else(connection)
        connection.release();
    return;
});

pool.query = util.promisify(pool.query);

module.exports = pool;
