const {executeQuery} = require('./db');
const fs = require('fs');
const path = '/Users/legend/Documents/ABB/updatedEditor/';

var create_table_query = fs.readFileSync(path + 'db/queries/create_tables.sql', 'utf-8');
executeQuery(create_table_query);