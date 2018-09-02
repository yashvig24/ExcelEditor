const sql = require('mssql');

const config = {
    options: {
        encrypt: true
    },
    user: 'nmarket', 
    password: 'Delta616',
    server: 'epm-nm-1.database.windows.net', 
    database: 'dayzero'
}

const pool = new sql.ConnectionPool(config);;

var connect = async function() {
    try {
        await pool.connect();
        console.log('Connected to database');
    } 
    catch(e) {
        console.log(e);
    }   
}

var close = async function() {
    try {
        await pool.close()
    } 
    catch(e) {
        console.log(e);
    }   
}

// Function to connect to database and execute query
var executeQuery = async function(query, res, csv) { 
    let result;
    try {
        console.log(query);
        result = await pool.request().query(query);
    }
    catch(e) {
        return console.log(e);
    }
    console.log(result);
    if(res) {
        if(csv) {
            res.send(result.recordset[0].content);
        }
        else
            res.send(result);
    }
    else {
        result = JSON.stringify(result);
        return result;
    }
    console.log('executed');
}

module.exports.executeQuery = executeQuery;
module.exports.connect = connect;
module.exports.close = close;
module.exports.config = config;
module.exports.pool = pool;