angular.module('addPlaceCtrl.controllers', [])

    .controller('addPlaceCtrl', function ($scope, APIService, $stateParams) {
        $scope.addplaceCtrl = {};
        $scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail = [];
        $scope.addplaceCtrl.placeObj = {};

        $scope.addPlaceDetails = function () {



            var obj =
                {
                    Name: $scope.addplaceCtrl.placeObj.Name,
                    UserAssignedPlace: $scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail,
                    IsActive: true, /*$scope.addplaceCtrl.placeObj.IsActive,*/
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
                    //PlaceId: "1509453611107",
                    Tags: $scope.addplaceCtrl.placeObj.Tags,
                    CreatedBy: parseInt(localStorage.getItem("UserId"))
                }

            if ((obj.Name && obj.Address)) {
                APIService.setData({ req_url: url_prifix + "place/addplaceandreps", data: obj }).then(function (res) {

                    if (res.data.Status == 'SUCCESS') {

                        console.log("Succes");
                    }


                })


            }
            else {

                alert('Please fill all Field');
            }

        }

        if ($stateParams.data) {
            $scope.placeDetails = JSON.parse($stateParams.data);

            console.log($scope.placeDetails);

        }


        if ($scope.placeDetails) {

            $scope.addplaceCtrl.placeObj = $scope.placeDetails;

            console.log($scope.addplaceCtrl.placeObj.Id)

            $scope.isUpdate = true;
        }
           else {
                   $scope.isUpdate = false;
               }

    
        
       

        $scope.addplaceCtrl.repsAutocompleteListFunction = function () {
            APIService.getData({
                req_url: url_prifix + 'representative/getallrepresentativebycreatedbyid?userId=' + localStorage.getItem("UserId")

            }).then(function (res) {
                if (res.data.Status == 'SUCCESS') {
                    $scope.addplaceCtrl.repsAutocompleteList = res.data.Data;
                    console.log(res.data.Data);
                }
            }, function (resp) {
                // This block execute in case of error.
            });
        }


        $scope.$watch('addplaceCtrl.repsAutocompleteListSelected', function () {
            if ($scope.addplaceCtrl.repsAutocompleteListSelected) {
                var isAvailable = false;
                angular.forEach($scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail, function (value, index) {

                    if (value.Id == $scope.addplaceCtrl.repsAutocompleteListSelected.originalObject.Id) {
                        isAvailable = true;
                    }
                })
                if (!isAvailable) {
                    $scope.addplaceCtrl.repsAutocompleteListSelected.originalObject.UserId = $scope.addplaceCtrl.repsAutocompleteListSelected.originalObject.Id;
                    $scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail.push($scope.addplaceCtrl.repsAutocompleteListSelected.originalObject);
                }

                console.log($scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail);
            }
        });
        $scope.addplaceCtrl.addRep = function (item) {
            console.log(item);
            $scope.addplaceCtrl.repsAutocompleteListSelected.push(item);
        }
        $scope.addplaceCtrl.repsAutocompleteListFunction();
        $scope.addplaceCtrl.removeDistributionItem = function (index) {
            $scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail.splice(index, 1);
        }

        $scope.addplaceCtrl.getAllAssignedRepresentative = function () {
            APIService.getData({
                req_url: url_prifix + 'place/getassigneduserofplacerepo?PlaceId=' + $scope.addplaceCtrl.placeObj.Id + '&adminId=' + localStorage.getItem("UserId")

            }).then(function (res) {
                console.log(res);
                $scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail = res.data.Data;
            })
        }
      
        $scope.addplaceCtrl.getAllAssignedRepresentative();



        $scope.addplaceCtrl.updatePlaceDetails = function () {
            $scope.addplaceCtrl.isSubmit = true;
            $scope.addplaceCtrl.placeObj.UserAssignedPlace = $scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail;
            var isValid = false;
            if (!isValid) {
                APIService.setData({
                    req_url: url_prifix + 'place/updateplacedetails',


                    data: $scope.addplaceCtrl.placeObj
                   
                }).then(function (res) {
                    console.log($scope.addplaceCtrl.placeObj)
                    $scope.message = res.data.message;
                    if (res.data.Status != "SUCCESS") {
                        alert(res.data.Data);
                    } else {
                        alert("Your Place Updated successfully.");
                        $scope.addplaceCtrl = {};
                        $scope.addplaceCtrl.FormsVisibleOnTheseRepsDetail = [];
                        $scope.addplaceCtrl.placeObj = {};
                        $scope.addplaceCtrl.isSubmit = false;
                    }
                }, function (resp) {
                    // This block execute in case of error.
                });
            }
        }
    })
