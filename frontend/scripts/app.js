(function() {

    "use strict";
  
    angular
      .module('ngEditor', ['ngMaterial'])
      .config(function($mdThemingProvider) {
  
        $mdThemingProvider.theme('default')
          .primaryPalette('blue-grey');
      });
      
  })();