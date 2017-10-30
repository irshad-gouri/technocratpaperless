angular.module('addPlaceCtrl.controllers', [])

    .controller('addPlaceCtrl', function ($scope, APIService, $stateParams) {
        $scope.addplaceCtrl = {};
        $scope.addplaceCtrl.placeObj = {};

        $scope.addPlaceDetails = function () {

            

            var obj =
                {
                    Name: $scope.addplaceCtrl.placeObj.Name,
                    /*  Representative: $scope.addplaceCtrl.placeObj.representatives, */    /*Its new in this Model*/
                    IsActive: $scope.addplaceCtrl.placeObj.IsActive,
                    Address: $scope.addplaceCtrl.placeObj.Address,
                    /* City: $scope.addplaceCtrl.place.city, */                            /*Its new in this Model*/
                    State: $scope.addplaceCtrl.placeObj.State,
                    PostalCode: $scope.addplaceCtrl.placeObj.PostalCode,                       /*Its new in this Model*/
                    Country: $scope.addplaceCtrl.placeObj.Country,
                    CountryCode: $scope.addplaceCtrl.placeObj.CountryCode,          /*Its new in this Model*/
                    //Email: $scope.addplaceCtrl.placeObj.email,
                    //Phone: $scope.addplaceCtrl.placeObj.Phone,                    /*Its new in this Model*/
                    //CellPhone: $scope.addplaceCtrl.placeObj.cell_phone,            /*Its new in this Model*/
                    Note: $scope.addplaceCtrl.placeObj.Note,
                    Website: $scope.addplaceCtrl.placeObj.Website,
                    //ContactName: $scope.addplaceCtrl.placeObj.contact_name,        /*Its new in this Model*/
                    //ContactTitle: $scope.addplaceCtrl.placeObj.contact_title,        /*Its new in this Model*/
                    //PhotoUrl: "",                                                /* this is not in this model*/
                    //Latitude: $scope.addplaceCtrl.placeObj.position.lat,          /* this is not in this model*/
                    //Longitude: $scope.addplaceCtrl.placeObj.position.lng,  
                    PlaceId: new Date().getTime(),
                    Tags: $scope.addplaceCtrl.placeObj.Tags,
                    CreatedBy: parseInt(localStorage.getItem("UserId"))
                }

            if ((obj.Name && obj.Address) == !null) {
                APIService.setData({ req_url: url_prifix + "place/addplace", data: obj }).then(function (res) {

                    if (res.data.Status == 'SUCCESS') {

                        console.log("Succes");
                    }


                })


            }
            else {

                alert('Please fill all Field');
            }
               
        }

       
        $scope.placeDetails = JSON.parse($stateParams.data);
        console.log($scope.placeDetails);
        
        if ($scope.placeDetails) {

            $scope.addplaceCtrl.placeObj = $scope.placeDetails;
           
        }


       

    })
