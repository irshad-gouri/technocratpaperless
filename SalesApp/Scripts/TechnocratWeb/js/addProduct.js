angular.module('addProduct.controllers', [])

    .controller('addProductCtrl', function ($scope, APIService) {

        $scope.addProductCtrl = {};
        $scope.addProductCtrl.ProductGroup = {};
        $scope.addProductCtrl.saveProductGroups = function () {

                var obj =
                    {
                        DisplayCode: $scope.addProductCtrl.ProductGroup.DisplayCode,
                        AdminId: parseInt(localStorage.getItem("UserId")),
                        IsActive: $scope.addProductCtrl.ProductGroup.IsActive,
                        Description: $scope.addProductCtrl.ProductGroup.Description,
                        CreatedBy: parseInt(localStorage.getItem("UserId"))
                    }

             
                    APIService.setData({ req_url: url_prifix + "product/addproductgroup", data: obj }).then(function (res) {

                        if (res.data.Status == 'SUCCESS') {

                            console.log("Succes");
                        }


                    })

                    $scope.addProductCtrl.ProductGroup = {};
                
        }
        $scope.addProductCtrl.addNewProductGroup = function () {
            
            $scope.addProductCtrl.ProductGroup.push({
                "DisplayCode": "",
                "IsActive": true,
                "Description": ""
               
            })
        }

        $scope.addProductCtrl.GetProductGroup = function () {
            APIService.getData({
                req_url: url_prifix + 'product/getproductgroup'

            }).then(function (res) {
                if (res.data.Status == 'SUCCESS') {
                    $scope.addProductCtrl.ProductGroup= res.data.Data;
           
                    console.log(res.data.Data);
                }
            }, function (resp) {
                // This block execute in case of error.
            });
        }
        $scope.addProductCtrl.GetProductGroup();


        $scope.addProductCtrl.saveProduct = function () {

            var obj =
                {
                    Name: $scope.addProductCtrl.ProductGroup.Name,
                    AdminId: parseInt(localStorage.getItem("UserId")),
                    IsActive: $scope.addProductCtrl.ProductGroup.IsActive,
                    EAN: $scope.addProductCtrl.ProductGroup.EAN,
                    CreatedBy: parseInt(localStorage.getItem("UserId")),
                    Note: $scope.addProductCtrl.ProductGroup.Note,
                    c: $scope.addProductCtrl.ProductGroup.ProductGroupId,
                    Tags: $scope.addProductCtrl.ProductGroup.Tags,
                    DefaultPrice: $scope.addProductCtrl.ProductGroup.DefaultPrice
                    
                }

            if (obj.Name && obj.DefaultPrice ) {

                APIService.setData({ req_url: url_prifix + "product/addproduct", data: obj }).then(function (res) {

                    if (res.data.Status == 'SUCCESS') {

                        console.log("Succes");
                    }


                })
            }
            else {
                alert("Please fill all the Field")
            }
           



        }



    })