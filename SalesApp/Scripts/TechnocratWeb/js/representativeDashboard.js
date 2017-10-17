angular.module('representativeDashboard.controllers', [])

    .controller('representativeDashboardCtrl', function($scope, APIService, $state ,$rootScope) {
        $scope.representativeDashboardCtrl = {};
        $scope.representativeDashboardCtrl.startImagePath = PhotoStorage;
        $scope.representativeDashboardCtrl.getAllRepresentative = function () {
            APIService.getData({
                req_url: url_prifix + 'representative/getallrepresentativebycreatedbyid?userId=' + localStorage.getItem("UserId")

            }).then(function (res) {
                if (res.data.Status == 'SUCCESS') {
                    $scope.representativeDashboardCtrl.representativeList = res.data.Data;
                    console.log(res.data.Data);
                }
            }, function (resp) {
                // This block execute in case of error.
            });
        }
        $scope.representativeDashboardCtrl.getAllRepresentative();
});
    
