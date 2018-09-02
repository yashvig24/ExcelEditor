const {executeQuery} = require('../db/db');
const fs = require('fs');
const dfjs = require('dataframe-js');
const papa = require('papaparse');

const path = '/Users/legend/Documents/ABB/updatedEditor/';
const firstTab = 3;
const thirdTab = 51;
const processes = {};

const mainfunction = 'pjm_dml_utils';

async function makeFile(selNum) {
    var query = fs.readFileSync(path + 'db/queries/getChanges.sql', 'utf-8');
    query = query.format("'" + selNum + "'");
    var changes = await executeQuery(query);
    var dl = "";
    try {
        changes = JSON.parse(changes).recordset;
        dl = fs.readFileSync(path + 'server/downloadable/constants/constants.txt', 'utf-8');
        var initialize = await tablesAndProcess(changes);
        var beef = await processChanges(changes, selNum);
        dl = dl.format(selNum, initialize, beef, selNum, selNum);
    }
    catch(e) {
        console.log(e);
    }
    return dl;
}

async function processChanges(changes, selNum) {
    var beef = "";
    try {
        Object.keys(changes).forEach(async (item) => {
            beef += processChange(changes[item], selNum);
        });
    }
    catch(e) {
        console.log(e);
    }
    return beef;
}

async function tablesAndProcess(changes) {
    var content = "";
    for(let i = 0; i < Object.keys(changes).length; i++) {
        var query = fs.readFileSync(path + 'db/queries/getProcess.sql', 'utf-8');
        query = query.format("'" + changes[i].table_nme.toLowerCase() + "'");
        var result = await executeQuery(query);
        try {
            result = JSON.parse(result).recordset[0];
            var rset = result.recordset;
            processes[changes[i].table_nme] = {
                'rset': rset,
                'function': result.process 
            };
            content += addSpaces(firstTab) + rset + addSpaces(thirdTab - rset.length)
                    + result.table_nme + "%ROWTYPE;\n";
        }
        catch(e) {
            console.log(e);
        }
    }
    return content;
}

function addSpaces(num) {
    var result = "";
    for(let i = 0; i < num; i++) {
        result += " ";
    }
    return result;
}

function processChange(change, selNum) {
    var beef = "";
    var csv = change.content.trim();
    var content = papa.parse(csv, {
        dynamicTyping: true
    }).data;
    var header = content[0];
    var df = new dfjs.DataFrame(content.slice(1, content.length), header);
    var fil = df.filter(row => row.get('SEL') == selNum);
    var changejson = fil.toDict();
    var keys = Object.keys(changejson);
    console.log(changejson);
    for(let i = 0; i < changejson[keys[0]].length; i++) {
        for(let j = 0; j < keys.length; j++) {
            var beeftemp = "";
            if(keys[j].toLowerCase() !== 'sel') {
                beeftemp += addSpaces(firstTab);
                var temp = processes[change.table_nme]['rset'] + '.' + keys[j].toLowerCase()
                beeftemp += temp + addSpaces(thirdTab - temp.length);
                var value = changejson[keys[j]][i];
                if(value == 'N/A') {
                    value = 'NULL';
                }
                else if(value == '[USER_ID]') {
                    value = 'lc_user_id'
                }
                else if(value == '[REVISED_DT_SYS]') {
                    value = 'lc_sysdate';
                }
                else if(value == '[LOWDATE]') {
                    value = 'lc_low_dt';
                }
                else if(value == '[HIGHDATE]') {
                    value = 'lc_high_dt';
                }
                else if(isNaN(value)) {
                    value = '\'' + value + '\'';
                }
                beeftemp += ":= " + value + '\n';
            }
            beef += beeftemp;
        }
        beef += '\n' + addSpaces(firstTab) + mainfunction + '.' +  
            processes[change.table_nme]['function'] + 
            '(' + processes[change.table_nme]['rset'] + ')' + '\n\n';
    }
    return beef;
}

module.exports.makeFile = makeFile;