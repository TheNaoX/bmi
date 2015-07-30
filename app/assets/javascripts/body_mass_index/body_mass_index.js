!function() {
  "use strict";

  angular.module("BMIApp").
    factory("BodyMassIndex", BodyMassIndex);

  BodyMassIndex.$inject = [ "$resource" ];

  function BodyMassIndex($resource) {
    return $resource("/body_mass_indices");
  };
}();
