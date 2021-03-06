angular.module('activitiesDashboard.controllers', [])

    .controller('activitiesDashboardCtrl', function ($scope, APIService, $state,$rootScope) {

        $scope.Activities = [];
        $scope.filterData = {};
        $scope.activitiesDashboardCtrl = {};
        $scope.Activities.PhotoStorage = PhotoStorage;
            $scope.GetActivities = function () {

                APIService.getData({
                    req_url: url_prifix + 'place/getusersactivitiesfordashboard?userId=' + localStorage.getItem("UserId")

                }).then(function (res) {
                    $scope.Activities = res.data.Data;
                    console.log($scope.Activities)
                    
                   
                    })

                


            }
            $scope.GetActivities();
           
           
            $scope.noteClick = function () {

                $scope.filterData.ActivityId ="4";

            }

            $scope.FormClickFilter = function () {

                $scope.filterData.ActivityId = "5";
                $scope.allActivitiesFilterShow = false;
            }
           

            $scope.photoClikFilter = function () {

                $scope.filterData.ActivityId = "3";
                $scope.allActivitiesFilterShow = false;
            }
           
            $scope.filterDataDate = {};
            $scope.filterDataDate.from_date = new Date();
            $scope.filterDataDate.to_date = new Date();

            
            $scope.formIdFilter = function (id)
            {
                $scope.filterData.FormId = id;
                $scope.allActivitiesFilterShow = false;
              
            }


            $scope.postCommentTrigger = function (act) {

             
           
                var comments =
                    {
                        CommentByUserId: localStorage.getItem("UserId"),
                        UsersActivitiesId: act.Id,
                        UserComment: $scope.activitiesDashboardCtrl.adminComment,
                        CreatedBy: localStorage.getItem("UserId")

                    }

             
                APIService.setData({ req_url: url_prifix + "place/adduseractivitycomments", data: comments }).then(function (res) {


                    APIService.getData({ req_url: url_prifix + "place/getusersactivitiescommentsbyactivityid?actId=" + act.Id }).then(function (res) {

                        $scope.Admincomments = res.data.Data;
                        console.log(res.data.Data)


                    })
                       


                    })


               

                //APIService.getData({ req_url: url_prifix + "place/getusersactivitiescommentsbyactivityid?actId=" + act.Id }).then(function (res) {

                //    $scope.Admincomments = res.data.Data;
                //    console.log(res.data.Data)


                //})
            
               
            }
          
         
            $scope.GetAllComments = function () {

                var activityId = $scope.activityId;

               

            }
            
           

})
    .filter('dateRange', function () {
        return function (items, fromDate, toDate,) {
            var filtered = [];

            //here you will have your desired input
            

                var from_date = Date.parse(new Date(fromDate));
                var to_date = Date.parse(new Date(toDate));
                angular.forEach(items, function (item, index) {
                    var CreatedDate = Date.parse(new Date(item.CreatedDate))
                    if (CreatedDate >= from_date && CreatedDate < to_date) {
                        filtered.push(item);
                    }
                });
                return filtered;
            


        };

    });
    // , APIService, $state, $rootScope, ngDialog


    //  $scope.page = 'main';
   



    //  APIService.setData({ req_url: url_prifix + 'api/getAllUser', data: {  } }).then(function (suc) {
    //      console.log(suc)
    //      $scope.data = suc.data;
    //      console.log($scope.data);
        
    //  }, function (er) { })



    //  return;



    // $scope.isfirst = true;
    // $rootScope.loadCompetition = true;
    // firebaseservices.getDataFromNode('/Users').then(function (suc) {
    //     console.log(suc);
       
    //     angular.forEach(suc, function (value, key) {
    //         if (typeof value == 'object') {
    //             var data = value;
    //             data.key = key;
    //             if (data.Recommendation) {

    //             data.RecommendationCount = Object.keys(data.Recommendation).length
    //             } else {
    //                 data.RecommendationCount = 0;
    //             } if (data.CreatedTasks) {

    //             data.CreatedTasksCount = Object.keys(data.CreatedTasks).length
    //             } else {
    //                 data.CreatedTasksCount = 0;
    //             }
    //             if (data.AppliedTasks) {

    //                 data.AppliedTasksCount = Object.keys(data.AppliedTasks).length
    //             } else {
    //                 data.AppliedTasksCount = 0;
    //             }
    //             if (data.CompletedAppliedTasks) {

    //                 data.CompletedAppliedTasksCount = Object.keys(data.CompletedAppliedTasks).length
    //             } else {
    //                 data.CompletedAppliedTasksCount = 0;
    //             }
               
               
    //             $scope.users.push(value);
    //         }

    //     })
        // if ($scope.isfirst) {
       
          //  $scope.locations.push($scope.users[0].location);

        //}
            // for (var i = 0; i < $scope.users.length; i++) {
            //     var data = true
            //     for (var j = 0; j < $scope.locations.length; j++) {
                  
            //         if ($scope.locations[j] == $scope.users[i].location) {
            //             data = false;
            //             j = $scope.locations.length;
            //         }
                   
            //     }
            //     if (data) {
            //         if ($scope.users[i].location) {

            //         $scope.locations.push($scope.users[i].location);
            //         }
            //     }

            // }
            // $rootScope.loadCompetition = false;
            // console.log($scope.locations);
      //  console.log($scope.users);
//     })
//     $scope.setStatus = function (status, user) {
//         // var current_status = orderObj.order_status;
//         if (user.AccountStatus == 'Active') {

//             user.AccountStatus = 'InActive';
//         } else {
//             user.AccountStatus = 'Active';
//         }
//         console.log($scope.users)
//     };
//     $scope.getCountOfKey = function (val,user) {
      
//         if (user[val]) {

//                 if (!user[val]) {
//                     return 0;
//                 } else {
//                     return Object.keys(user[val]).length
//                 }
//         } else {
//             return 0;
//         }

        
//     }
// })

// .filter('KarmaPoints', function () {
//     return function (items, points) {
//         var filtered = [];
//         // console.log(items)
//         if (items) {
//             if (points) {
//                 //  alert(JSON.stringify(items))
//                 angular.forEach(items, function (value, key) {
//                     // alert(JSON.stringify(value))
                   

//                     var pointsorigin = parseInt(value.KarmaPoints)
//                         var checkPointWith = parseInt(points);
//                         // alert(value.distance + "==============" + filterDistance)
//                         if (pointsorigin <= checkPointWith) {
//                             //  alert(itemDistance);
//                             filtered.push(value);
//                         }
                    
//                 })
//                 return filtered;
//             } else {
//                 return items;
//             }

//         } else {

//             return items;
//         }
//     };
// })