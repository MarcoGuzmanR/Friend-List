// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var app = angular.module('friendList', ['ui.bootstrap']);
var modalTemplate = "<div class='modal-header'>\
                       <h3 class='modal-title'>Add new friend</h3>\
                     </div>\
                     <div class='modal-body'>\
                       <form id='addFriend' class='form-horizontal'>\
                         <label for='friendName'>Name:</label>\
                         <input type='text' id='friendName' class='form-control' name='friendName'>\
                         <label for='friendEmail'>Email:</label>\
                         <input type='text' id='friendEmail' class='form-control' name='friendEmail'>\
                       </form>\
                     </div>\
                     <div class='modal-footer'>\
                       <button class='btn btn-primary' ng-click='addFriend()'>Add Friend</button>\
                       <button class='btn btn-warning' ng-click='cancel()'>Cancel</button>\
                     </div>";

app.controller('friendsController', ['$scope', '$http', '$modal', function($scope, $http, $modal) {
  $scope.showModal = function(member_id) {
    $scope.member_id = member_id;
    var modalInstance = $modal.open({
      template: modalTemplate,
      controller: ModalInstanceCtrl,
      scope: $scope
    });
  }

  var ModalInstanceCtrl = ['$scope', '$modalInstance', function($scope, $modalInstance) {
    $scope.addFriend = function() {
      var token = $('meta[name="csrf-token"]').attr('content');
      console.log($scope.member_id);
      $http({
        method: 'post',
        url: '/friends',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded',
                   'X-CSRF-Token': token },
        data: {
          name: $('#friendName').val(),
          email: $('#friendEmail').val(),
          member_id: $scope.member_id
        }
      }).success(function(result) {
        $modalInstance.dismiss('cancel');
      });
    };

    $scope.cancel = function() {
      $modalInstance.dismiss('cancel');
    };
  }];
}]);





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
