angular.module('addPlaceCtrl', [])

    .controller('addplaceCtrl', function ($scope, $state, mapservices, ) {
        $scope.addplaceCtrl = {};
        $scope.addplaceCtrl.placeObj = {};

        $scope.addPlace = function (data) {
        
                       
                        var obj =
                            {
                                Name: $scope.addplaceCtrl.placeObj.name,
                                Representative: $scope.addplaceCtrl.placeObj.representatives,     /*Its new in this Model*/
                                IsActive: $scope.addplaceCtrl.placeObj.active,
                                Address: $scope.addplaceCtrl.place.address,
                                City: $scope.addplaceCtrl.place.city,                             /*Its new in this Model*/
                                State: $scope.addplaceCtrl.placeObj.state,
                                ZipCode: $scope.addplaceCtrl.place.zip,                       /*Its new in this Model*/
                                Country: $scope.addplaceCtrl.place.country,
                                CountryCode: $scope.addplaceCtrl.placeObj.countryCode,          /*Its new in this Model*/
                                Email: $scope.addplaceCtrl.placeObj.email,
                                Phone: $scope.addplaceCtrl.placeObj.Phone,                    /*Its new in this Model*/
                                CellPhone: $scope.addplaceCtrl.placeObj.cell_phone,            /*Its new in this Model*/
                                Note: $scope.addplaceCtrl.placeObj.note,
                                Website: $scope.addplaceCtrl.placeObj.website,
                                ContactName: $scope.addplaceCtrl.placeObj.contact_name,        /*Its new in this Model*/
                                ContactTitle: $scope.addplaceCtrl.placeObj.contact_title,        /*Its new in this Model*/
                                PhotoUrl: "",                                                /* this is not in this model*/
                                PlaceId: $scope.addplaceCtrl.placeObj.placeId,
                                Latitude: $scope.addplaceCtrl.placeObj.position.lat,          /* this is not in this model*/
                                Longitude: $scope.addplaceCtrl.placeObj.position.lng,          /* this is not in this model*/
                                Tags: $scope.addplaceCtrl.placeObj.tag,                  
                                Id: parseInt(localStorage.getItem("UserId")),              
                                CreatedBy: userDetail.CreatedById                            
                            }

                       
                    }
                })
