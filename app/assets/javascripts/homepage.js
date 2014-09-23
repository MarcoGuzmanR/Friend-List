// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var app = angular.module('friendList', []);

app.controller('membersController', ['$scope', '$http', function($scope, $http) {
  $scope.init = function() {
    $http.get('/members').success(function(data) {
      $scope.members = data.members;
    });
  }
}]);
