angular.module('addRepresentative.controllers', [])

    .controller('addRepresentativeController', function ($scope, $state, APIService, Upload, $timeout,$stateParams) {
        $scope.addRepresentativeController = {};
        $scope.addRepresentativeController.PhotoUrl = "./images/no_avatar_putnik.png";
        $scope.addRepresentativeController.startImagePath = PhotoStorage;
        $scope.addRepresentativeController.uploadFiles = function (file, errFiles) {
                  $scope.f = file;
                  $scope.errFile = errFiles && errFiles[0];
                  if (file) {
                      file.upload = Upload.upload({
                          url: url_prifix + "utility/uploadimage",
                          data: { file: file }
                      });

                      file.upload.then(function (response) {
                          $timeout(function () {
                              console.log(response);
                              
                              file.result = response.data.Data;
                              $scope.addRepresentativeController.PhotoUrl = response.data.Data.path;
                          });
                      }, function (response) {
                          if (response.status > 0)
                              $scope.errorMsg = response.status + ': ' + response.data;
                      }, function (evt) {
                          file.progress = Math.min(100, parseInt(100.0 *
                              evt.loaded / evt.total));
                      });
                  }
        }
        $scope.addRepresentativeController.getUserDetails = function () {
            APIService.getData({
                req_url: url_prifix + 'account/getuserdetail?userId=' + localStorage.getItem("UserId")

            }).then(function (res) {
                if (res.data.Status == 'SUCCESS') {
                    $scope.adminDetail = res.data.Data;
                    $scope.addRepresentativeController.adminDetails = res.data.Data;
                    console.log(res.data.Data);
                }
            }, function (resp) {
                // This block execute in case of error.
            });
        }
        $scope.addRepresentativeController.getUserDetails();
        $scope.addRepresentativeController.submitNewRepresentative = function () {
            $scope.addRepresentativeController.CompanyId = $scope.addRepresentativeController.adminDetails.CompanyId;
            $scope.addRepresentativeController.RoleId = 2;
            $scope.addRepresentativeController.City = "_";
            $scope.addRepresentativeController.Address = "_";
            $scope.addRepresentativeController.Country = "_";
            $scope.addRepresentativeController.LastName = $scope.addRepresentativeController.FirstName.substring($scope.addRepresentativeController.FirstName.lastIndexOf(" "));
            $scope.addRepresentativeController.PostalCode = "";
            $scope.addRepresentativeController.CreatedById = $scope.addRepresentativeController.adminDetails.UserId;
            APIService.setData({
                req_url: url_prifix + 'account/register',
                data: $scope.addRepresentativeController
            }).then(function (res) {
                if (res.data.Status != "SUCCESS") {
                    alert(res.data.Data);
                    $scope.addRepresentativeController = {};
                    $scope.addRepresentativeController.adminDetails = $scope.adminDetail;
                } else {
                    alert(res.data.Data);
                }
            }, function (resp) {
                // This block execute in case of error.
            });
        }

        $scope.userdetails = JSON.parse($stateParams.data);
        console.log($scope.userdetails);
    })