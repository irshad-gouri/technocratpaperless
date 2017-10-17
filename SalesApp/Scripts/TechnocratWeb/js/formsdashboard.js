angular.module('formsdashboard.controllers', [])

    .controller('formsdashboardCtrl', function($scope, APIService, $state) {

        $scope.formsdashboardCtrl = {};

    $scope.formsdashboardCtrl.getallcustomformsbyid = function () {
        APIService.getData({
            req_url: url_prifix + 'customforms/getallcustomformsbyid?userId=' + localStorage.getItem("UserId")

        }).then(function (res) {
            if (res.data.Status == 'SUCCESS') {
                $scope.formsdashboardCtrl= res.data.Data;
                console.log(res.data.Data);
            }
        }, function (resp) {
           
        });
        }
  
   

     $scope.formsdashboardCtrl.getallcustomformsbyid();




























    // $scope.feedbackList = [];
    // $scope.getFeedback = function() {
    //     APIService.setData({
    //         req_url: url_prifix + 'api/getFeedback',
    //         data: {}
    //     }).then(function(resp) {
    //       console.log("====resp======",resp);
    //         if(resp.data) {
    //             $scope.feedbackList = resp.data;
    //         }
    //        },function(resp) {
    //           // This block execute in case of error.
    //     });
    // };
    // $scope.getFeedback();
    // $scope.deleteFeedback = function (feedback) {
    //   var modalInstance = $uibModal.open({
    //       animation: $scope.animationsEnabled,
    //       templateUrl: 'partials/deleteConfirmation.html',
    //       controller: 'DeleteConfirmationCtrl',
    //       size: 'md',
    //       resolve: {
    //           id: function () {
    //               return feedback._id;
    //           },
    //           url: function () {
    //               return url_prifix + 'api/deleteFeedback';
    //           }
    //       }
    //   });
    //   modalInstance.result.then(function (data) {
    //       ngDialog.open({ template: 'partials/deletePopup.html', className: 'ngdialog-theme-default' });
    //       if(data) {
    //           $scope.feedbackList = data;
    //       }
    //   }, function () {
    //     $log.info('Modal dismissed at: ' + new Date());
    //   });
    // };
})
