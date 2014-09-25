// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var app = angular.module('friendList', ['ui.bootstrap']);
var modalTemplate = "<div class='modal-header'>\
                       <h3 class='modal-title'>Add new member</h3>\
                     </div>\
                     <div class='modal-body'>\
                       <form id='addMember' class='form-horizontal'>\
                         <label for='memberName'>Name:</label>\
                         <input type='text' id='memberName' class='form-control' name='memberName'>\
                         <label for='memberEmail'>Email:</label>\
                         <input type='text' id='memberEmail' class='form-control' name='memberEmail'>\
                       </form>\
                     </div>\
                     <div class='modal-footer'>\
                       <button class='btn btn-primary' ng-click='addMember()'>Add Member</button>\
                       <button class='btn btn-warning' ng-click='cancel()'>Cancel</button>\
                     </div>";

app.controller('membersController', ['$scope', '$http', '$modal', function($scope, $http, $modal) {
  $scope.init = function() {
    $http({
      method: 'get',
      url: '/get_members'
    }).success(function(data) {
      $scope.members = data.members;
    });
  }

  $scope.showModal = function() {
    var modalInstance = $modal.open({
      template: modalTemplate,
      controller: ModalInstanceCtrl
    });
  }

  var ModalInstanceCtrl = function($scope, $modalInstance) {
    $scope.addMember = function() {
      var token = $('meta[name="csrf-token"]').attr('content');
      $http({
        method: 'post',
        url: '/members',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded',
                   'X-CSRF-Token': token },
        data: {
          name: $('#memberName').val(),
          email: $('#memberEmail').val(),
        }
      }).success(function(result) {
        $modalInstance.dismiss('cancel');
      });
    };

    $scope.cancel = function() {
      $modalInstance.dismiss('cancel');
    };
  };
}]);
