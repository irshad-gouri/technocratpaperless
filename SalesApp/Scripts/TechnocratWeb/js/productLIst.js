
angular.module('productLIst.controllers', [])

<<<<<<< HEAD
    .controller('productLIstCtrl', function ($scope) {


=======
    .controller('productLIstCtrl', function ($scope, APIService) {

        $scope.productLIstCtrl = {};


        $scope.productLIstCtrl.GetProducts = function () {
            APIService.getData({
                req_url: url_prifix + 'product/getproducts?adminId=' + localStorage.getItem("UserId")

            }).then(function (res) {
                if (res.data.Status == 'SUCCESS') {
                    $scope.productLIstCtrl= res.data.Data;

                    console.log(res.data.Data);
                }
            }, function (resp) {
                // This block execute in case of error.
            });
        }
        $scope.productLIstCtrl.GetProducts();
>>>>>>> 81466302cbc040f96a9c4f872a7d8efac17f1a19
    })