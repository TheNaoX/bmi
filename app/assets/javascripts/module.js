!function() {
  "use strict";

  angular.module("BMIApp", ["ngResource"]).
    config(config);

  config.$inject = [ "$httpProvider" ];

  function config($httpProvider) {
    $httpProvider.defaults.headers.common['Accept']     = "application/json";
    $httpProvider.defaults.headers.post['Content-Type'] = "application/json";
    $httpProvider.defaults.headers.put['Content-Type']  = "application/json";
  };
}()
