(function() {
    "use strict";

angular
    .module('ngEditor')
    .controller('editorCtrl', function($scope, $mdSidenav) {
        const appurl = 'http://localhost:3000';

        String.prototype.format = function () {
            var i = 0, args = arguments;
            return this.replace(/{}/g, function () {
                return typeof args[i] != 'undefined' ? args[i++] : '';
            });
        };

        $scope.selectedMarket = {};
        $scope.selectedTable = {};
        var markets = new Set();
        $scope.marketArr = [];
        $scope.tables = [];
        $scope.selNum = "";

        populateMarkets();

        $scope.toggleSideNav = function() {
            $mdSidenav('left').toggle();
        };

        async function populateMarkets() {
            try {
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", appurl + "/markets", true);
                xhttp.setRequestHeader("Content-type", "application/json");
                xhttp.onreadystatechange = function() {
                    var result = xhttp.response;
                    result = JSON.parse(result);
                    result.recordset.forEach((market) => {
                        markets.add(market.market_nme);
                    });
                    $scope.marketArr = [];
                    markets.forEach((market) => {
                        $scope.marketArr.push(market);
                    });
                } 
                xhttp.send(null);
            }
            catch(e) {
                console.log(e);
            }
            return null;
        };

        $scope.populateTable = async function(market) {
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", appurl + "/markets/" + market, true);
            xhttp.setRequestHeader("Content-type", "application/json");
            xhttp.onreadystatechange = function() {
                if(xhttp.readyState == 4) {
                    var result = JSON.parse(xhttp.response);
                    result.recordset.forEach((item) => {
                        $scope.tables.push(item);
                    });
                }
            }
            xhttp.send(null);
            return null;
        }

        $scope.displayTable = async function(table) {
            $('#current-table').jexcel({
                csv: appurl + '/markets/' + $scope.selectedMarket + '/' + table,
                csvHeaders: true,
                tableOverflow: true,
                tableHeight:'400px'
            });
        }

        $scope.addMarket = async function(event) {
            var files = event.target.files;
            if(files) {
                var folderName = files[0].webkitRelativePath.split("/")[0];
                await insertMarket(folderName);
                for (let i = 0; i < files.length; i++) {
                    console.log(i);
                    await mainUpload(files[i], folderName);
                }
            }
            return null;
        };
        
        async function mainUpload(f, folderName) {
            var reader = new FileReader();
            console.log('Uploading ' + f.name + ' under folder ' + folderName);
            reader.addEventListener("load", fileRead, false);
            // add an event listener for the onloaded event
        
            async function fileRead(event) {
                var csv = event.target.result;
                await insertTable(f, folderName, csv);
            }
        
            reader.readAsText(f); 
            return null;
        }
        
        async function insertMarket(market) {
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", appurl + "/addMarket", true);
            xhttp.setRequestHeader("Content-type", "application/json");
            xhttp.onreadystatechange = function() {
                if(xhttp.readyState == 4) {
                    console.log(xhttp.response);
                    populateMarkets();
                }
            }
            xhttp.send(JSON.stringify({'marketName': market}));
            return null;
        }
        
        async function insertTable(table, market, content) {
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", appurl + "/addTable", true);
            xhttp.setRequestHeader("Content-type", "application/json");
            var json = {
                marketName: market,
                tableName: table.name.split('.')[0],
                content: content
            };
            console.log(json);
            xhttp.onreadystatechange = function() {
                if(xhttp.readyState == 4) {
                    console.log(xhttp.response);
                }
            }
            xhttp.send(JSON.stringify(json));
            return null;
        }
        
        $scope.saveChanges = function() {
            var xhttp = new XMLHttpRequest();
            xhttp.open("POST", appurl + "/updateTable", true);
            xhttp.setRequestHeader("Content-type", "application/json");
            var data = $('#current-table').jexcel('getData');
            var headers = [];
            document.getElementById('current-table').querySelectorAll('td').forEach(addHeaders);
            function addHeaders(item) {
                if(item.hasAttribute("title")) {
                    headers.push(item.getAttribute("title"));
                }
            }
            var completeData = [];
            completeData.push(headers);
            data.forEach(function(item) {
                completeData.push(item);
            });
            var content = $.csv.fromArrays(completeData);
            const stories = new dfjs.DataFrame(data, headers)
            // stories.show();
            .select('SEL')
            .filter(row => row.get('SEL') !== '')
            .toArray();
            console.log(stories);
            var json = {
                marketName: $scope.selectedMarket,
                tableName: $scope.selectedTable.table_nme,
                content: content,
                selNums: stories
            };
            xhttp.send(JSON.stringify(json));
            return null;
        }


        // -------------------------------------------------------------------
        // Download button implementation
        // -------------------------------------------------------------------
        function saveFile(filename, content) {
            var element = document.createElement('a');
            element.setAttribute(
                'href', 
                'data:text/plain;charset=utf-8,' + encodeURIComponent(content)
            );
            element.setAttribute('download', filename);

            element.style.display = 'none';
            document.body.appendChild(element);
            element.click();
            document.body.removeChild(element);
        }

        $scope.download = async function() {
            var xhttp = new XMLHttpRequest();
            var dlUrl = appurl + "/download/" + $scope.selNum;
            xhttp.open("GET", dlUrl, true);
            xhttp.onreadystatechange = function() {
                if(xhttp.readyState == 4) {
                    var content = xhttp.response; // get content property of response
                    var filename = $scope.selNum + ".sql";
                    saveFile(filename, content);
                    // console.log(content);
                }
            }
            xhttp.send(null);
        }
    });
  })();