// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var app = angular.module('friendList', ['ui.bootstrap']);
app.controller('membersController', ['$scope', '$http', function($scope, $http) {
  $scope.init = function() {
    $http({
      method: 'get',
      url: '/get_members'
    }).success(function (data) {
      $scope.members = data.members;
    });
  }
}]);
