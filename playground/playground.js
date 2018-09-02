const {executeQuery} = require('../db/db');

var showFunctions = "select * from functions";
var showTables = "SELECT name FROM sys.tables"
executeQuery(showFunctions);