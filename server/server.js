const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const {makeFile} = require('./makeDowloadFile');
const path = '/Users/legend/Documents/ABB/updatedEditor/';

const {executeQuery} = require('../db/db');
const {connect} = require('../db/db');
const {close} = require('../db/db');

var app = express();

// construct string.format function
String.prototype.format = function () {
    var i = 0, args = arguments;
    return this.replace(/{}/g, function () {
        return typeof args[i] != 'undefined' ? args[i++] : '';
    });
};

//CORS Middleware
app.use(function (req, res, next) {
    //Enabling CORS 
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, contentType,Content-Type, Accept, Authorization");
    next();
});

app.use(express.static('/Users/legend/Documents/ABB/updatedEditor/frontend'));

// Body Parser Middleware
app.use(bodyParser.json()); 

var port = process.env.PORT || 3000;

// Setting up server
app.listen(port, () => {
    console.log('started on port ' + port);
    connect();
});

app.get('/markets', (req, res) => {
    var query = fs.readFileSync(path + 'db/queries/getMarkets.sql', 'utf-8');
    try {
        executeQuery(query, res);
    }
    catch(e) {
        console.log(e);
    }
});

app.get('/markets/:market', (req, res) => {
    var query = fs.readFileSync(path + 'db/queries/getMarket.sql', 'utf-8');
    query = query.format("'" + req.params.market + "'");
    try {
        executeQuery(query, res);
    }
    catch(e) {
        console.log(e);
    }
});

app.get('/markets/:market/:table', (req, res) => {
    var query = fs.readFileSync(path + 'db/queries/getContent.sql', 'utf-8');
    query = query.format("'" + req.params.market + "'", "'" + req.params.table + "'");
    try {
        executeQuery(query, res, true);
    }
    catch(e) {
        console.log(e);
    }
});

app.post('/addMarket', (req, res) => {
    var query = fs.readFileSync(path + 'db/queries/insertMarket.sql', 'utf-8');
    query = query.format("'" + req.body.marketName + "'");
    try {
        executeQuery(query, res);
    }
    catch(e) {
        console.log(e);
    }
});

app.post('/addTable', (req, res) => {
    var query = fs.readFileSync(path + 'db/queries/insertTable.sql', 'utf-8');
    query = query.format("'" + req.body.marketName + "'", "'" + req.body.tableName + "'", "'" + req.body.content + "'");
    try {
        executeQuery(query, res);
    }
    catch(e) {
        console.log(e);
    }
});

app.post('/updateTable', (req, res) => {
    var query = fs.readFileSync(path + 'db/queries/updateTable.sql', 'utf-8');
    query = query.format(
        "'" + req.body.content + "'", 
        "'" + req.body.marketName + "'", 
        "'" + req.body.tableName + "'"
    );
    
    var tempQ = fs.readFileSync(path + 'db/queries/updateChange.sql', 'utf-8');
    var stories = req.body.selNums;
    for(let i = 0; i < stories.length; i++) {
        var story = stories[i][0];
        var add = tempQ.format(
            "'" + req.body.marketName + "'",
            "'" + req.body.tableName + "'",
            "'" + story + "'"
        );
        query += add;
    }
    try {
        executeQuery(query, res);
    }
    catch(e) {
        console.log(e);
    }
});

app.get('/download/:selNum', async function(req, res) {
    var selNum = req.params.selNum;
    var content = await makeFile(selNum);
    res.send(content);
});