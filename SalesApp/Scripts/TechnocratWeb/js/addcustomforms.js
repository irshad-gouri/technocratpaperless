angular.module('form.addcustomform', [])

    .controller('addcustomformCtrl', function ($scope, TypesOfInputs, APIService, $stateParams) {
        $scope.addcustomformCtrl = {};
        $scope.addcustomformCtrl.FormsQuestionFieldDetail = [];
        $scope.addcustomformCtrl.FormsVisibleOnTheseRepsDetail = [];
        $scope.addcustomformCtrl.isSubmit = false;
        $scope.addcustomformCtrl.removeField = function (index) {
            $scope.addcustomformCtrl.FormsQuestionFieldDetail.splice(index, 1);
        }
        $scope.addcustomformCtrl.UserId = localStorage.getItem("UserId");
        $scope.addcustomformCtrl.TypesOfInputs = TypesOfInputs.TypesOfInputs;
        $scope.addcustomformCtrl.addNewField = function () {
            $scope.addcustomformCtrl.FormsQuestionFieldDetail.push({
                "Question": "",
                "IsMandatory": false,
                "InputFieldsId": 1,
                "ListOptions": [],
                "CreatedDate": new Date().toISOString(),
                "ModefiedDate": new Date().toISOString(),
                "showInputTypeClass": "icon-text",
                "isFieldValid":true
            })
        }
        $scope.addcustomformCtrl.repsAutocompleteListFunction = function () {
            APIService.getData({
                req_url: url_prifix + 'representative/getallrepresentativebycreatedbyid?userId=' + localStorage.getItem("UserId")
               
            }).then(function (res) {
                if (res.data.Status == 'SUCCESS') {
                    $scope.addcustomformCtrl.repsAutocompleteList = res.data.Data;
                    console.log(res.data.Data);
                }
            }, function (resp) {
                // This block execute in case of error.
            });
        }
        $scope.$watch('addcustomformCtrl.repsAutocompleteListSelected', function () {
            if ($scope.addcustomformCtrl.repsAutocompleteListSelected) {
                var isAvailable = false;
                angular.forEach($scope.addcustomformCtrl.FormsVisibleOnTheseRepsDetail, function (value, index) {
                   
                    if (value.Id == $scope.addcustomformCtrl.repsAutocompleteListSelected.originalObject.Id) {
                        isAvailable = true;
                    }
                })
                if (!isAvailable) {
                    $scope.addcustomformCtrl.repsAutocompleteListSelected.originalObject.UserId = $scope.addcustomformCtrl.repsAutocompleteListSelected.originalObject.Id;
                    $scope.addcustomformCtrl.FormsVisibleOnTheseRepsDetail.push($scope.addcustomformCtrl.repsAutocompleteListSelected.originalObject);
                }

                console.log($scope.addcustomformCtrl.FormsVisibleOnTheseRepsDetail);
            }
        });
        $scope.addcustomformCtrl.addRep = function (item) {
            console.log(item);
            $scope.addcustomformCtrl.repsAutocompleteListSelected.push(item);
        }
        $scope.addcustomformCtrl.repsAutocompleteListFunction();
        $scope.addcustomformCtrl.changeTypeOfInputIcon = function (event, index) {
            $scope.addcustomformCtrl.inputIndexSelected = index;
            $scope.addcustomformCtrl.positionOfSideInputToolbar = { "display": "block", "left": "-90px", "top": (event.pageY - 260) + "px" };
        }
        $scope.addcustomformCtrl.setInputType = function (type) {
            $scope.addcustomformCtrl.FormsQuestionFieldDetail[$scope.addcustomformCtrl.inputIndexSelected].showInputTypeClass = $scope.addcustomformCtrl.getIconName(type).icon;
            $scope.addcustomformCtrl.FormsQuestionFieldDetail[$scope.addcustomformCtrl.inputIndexSelected].InputFieldsId = $scope.addcustomformCtrl.getIconName(type).id;
        
            $scope.addcustomformCtrl.positionOfSideInputToolbar = { "display": "none"};
        }
        $scope.addcustomformCtrl.addEmptySelectionOption = function (parentIndex) {
            $scope.addcustomformCtrl.FormsQuestionFieldDetail[parentIndex].ListOptions.push({value:""});
            console.log($scope.addcustomformCtrl.FormsQuestionFieldDetail[parentIndex].ListOptions);
        }
        $scope.addcustomformCtrl.removeSelectionOption = function (parentIndex, index) {
            console.log(parentIndex + "   " + index);
            $scope.addcustomformCtrl.FormsQuestionFieldDetail[parentIndex].ListOptions.splice(index, 1);
        }
        $scope.addcustomformCtrl.removeDistributionItem = function (index) {
            $scope.addcustomformCtrl.FormsVisibleOnTheseRepsDetail.splice(index, 1);
        }


        $scope.addcustomformCtrl.saveFormTrigger = function () {
            $scope.addcustomformCtrl.isSubmit = true;
            var isValid = false;
            angular.forEach($scope.addcustomformCtrl.FormsQuestionFieldDetail, function (value, index) {
                var lstOpt = "";
                if (value.ListOptions.length > 0) {
                    angular.forEach(value.ListOptions, function (value1, index1) {
                        if (value.ListOptions.length - 1 == index1) {
                            lstOpt += value1.value;
                        } else {
                            lstOpt += value1.value + ",";
                        }
                        
                    })
                    value.ListOptions = lstOpt;
                }
                if (!value.Question) {
                    isValid = true
                }
            });
            if (!isValid) {
                APIService.setData({
                    req_url: url_prifix + 'place/addcustomeforms',
                    data: $scope.addcustomformCtrl
                }).then(function (res) {
                    $scope.message = res.data.message;
                    if (res.data.Status != "SUCCESS") {
                        alert(res.data.Data);
                    } else {
                        alert("Your form saved successfully.");
                        $scope.addcustomformCtrl = {};
                        $scope.addcustomformCtrl.positionOfSideInputToolbar = { "display": "none" };
                        $scope.addcustomformCtrl.FormsQuestionFieldDetail = [];
                        $scope.addcustomformCtrl.FormsVisibleOnTheseRepsDetail = [];
                        $scope.addcustomformCtrl.isSubmit = false;
                    }
                }, function (resp) {
                    // This block execute in case of error.
                });
            }
        }
        $scope.addcustomformCtrl.getIconName = function (inputId) {
            switch (inputId) {
                case 1:
                    {
                        return { icon: "icon-text", id: 1 };
                        break;
                    }
                case 2:
                    {
                        return {icon:"icon-longtext", id: 2};
                        break;
                    }
                case 9:
                    {
                        return { icon: "icon-numeric", id: 9 };
                        break;
                    }
                case 5:
                    {
                        return { icon: "icon-boolean", id: 5 };
                        break;
                    }
                case 6:
                    {
                        return { icon: "icon-selection", id: 6 };
                        break;
                    }
                case 4:
                    {
                        return { icon: "icon-form-photo", id: 4 };
                        break;
                    }
                case 3:
                    {
                        return { icon: "icon-date", id: 3 };
                        break;
                    }
                case 7:
                    {
                        return { icon: "icon-header", id: 7 };
                        break;
                    }
                case 10:
                    {
                        return { icon: "icon-form-barcode", id: 10 };
                        break;
                    }
                case 8:
                    {
                        return "icon-product";
                        break;
                    }
            }
        }



        //$scope.title =JSON.parse($stateParams.data);
        //$scope.FormId = $scope.title.Id;
        //console.log($scope.title.Title);

        

        $scope.getQuestion = function (id) {
            APIService.getData({
                req_url: url_prifix + 'place/getquestionsbyformsid?formId=' +id

            }).then(function (res) {
                console.log(res);
                    if (res.data.Status == 'SUCCESS') {
                        $scope.addcustomformCtrl.FormsQuestionFieldDetail = res.data.Data;
                        angular.forEach($scope.addcustomformCtrl.FormsQuestionFieldDetail, function (value, index) {
                            value.showInputTypeClass = $scope.addcustomformCtrl.getIconName(value.InputFieldsId).icon;
                            if (value.ListOptions) {
                                var letListOptions = value.ListOptions.split(',');
                                var newVar = [];
                                angular.forEach(letListOptions, function (val, ind) {
                                    newVar.push({ value: val });
                                });
                                value.ListOptions = newVar;
                               
                            }

                        })
                       // console.log(res.data.Data);
                    }
                }, function (resp) {

                });
        }

        $scope.getAllAssignedRepresentative = function (id) {
            APIService.getData({
                req_url: url_prifix + 'customforms/getassigneduserofform?formId=' + id + '&adminId=' + localStorage.getItem("UserId")

            }).then(function (res) {
                console.log(res);
           })
        }

        if ($stateParams.data) {
            var localData = JSON.parse($stateParams.data);
            $scope.addcustomformCtrl.Title = localData.Title;
            $scope.addcustomformCtrl.IsActive = localData.IsActive;
            $scope.addcustomformCtrl.Description = localData.Description;
            $scope.getQuestion(localData.Id);
            $scope.getAllAssignedRepresentative(localData.Id);
        }

        //$scope.getQuestion();
    });
