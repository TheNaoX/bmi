!function() {
  "use strict";

  angular.module("BMIApp").
    controller("BodyMassIndexController", BodyMassIndexController);

  BodyMassIndexController.$inject = [ "BodyMassIndex" ];

  function BodyMassIndexController(BodyMassIndex) {
    var body_mass_index = this;

    body_mass_index.model = new BodyMassIndex();
    body_mass_index.collection = BodyMassIndex.query();


    body_mass_index.save = function() {
      body_mass_index.model.$save().then(function(bmi) {
        body_mass_index.collection.push(bmi);
        body_mass_index.model = new BodyMassIndex();
        body_mass_index.message = "Your body mass index is " + bmi.index + " you are " + bmi.category;
      });
    };
  };
}()
