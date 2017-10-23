angular.module('login.controllers', [])

    .controller('LoginController', function ($scope, $state, APIService) {
        $scope.LoginController = {};
        $scope.LoginController.doLogin = function (loginData) {
            loginData.RoleId = 1;
      APIService.setData({
          req_url: url_prifix + 'account/login',
          data: loginData
      }).then(function(res) {
          $scope.message = res.data.message;
          if (res.data.Status != "SUCCESS") {
              alert(res.data.Data);
          } else {
              console.log(res.data);
              localStorage.setItem("UserId", res.data.Data.Id);
              localStorage.setItem("UserDetails", JSON.stringify(res.data.Data));
              $state.go('app.placedashboard');
          }
         },function(resp) {
            // This block execute in case of error.
      });
  };
  $scope.sendPassword = function() {
      APIService.setData({
          req_url: url_prifix + 'api/forgotAdminPassword',
          data: {}
      }).then(function(resp) {
            $scope.forgotMessage = resp.data.successMessage;
         },function(resp) {
            // This block execute in case of error.
            $scope.forgotMessage = "Unable to send password. Please try again.";
      });
  };

});




// httpservices.setData({ req_url: URL + 'api/getInvestments', data: { user_id: data.user._id } }).then(function (suc) {
//     console.log(suc)
//     $scope.data = suc.data;
//     angular.forEach($scope.data, function (value, key) {
//         console.log(value)
//         httpservices.setData({ req_url: URL + 'api/getProperties', data: { _id: value.property_id } }).then(function (res) {
//             value.investors = res.data[0].investors;
//             console.log(res)
//         }, function (er) {


//         })
//     })