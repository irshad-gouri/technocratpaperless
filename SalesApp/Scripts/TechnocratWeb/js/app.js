
var url_prifix = "http://localhost/SalesApp/api/";
var PhotoStorage = "http://localhost/SalesApp/";
//var url_prifix = "http://technocrat92-001-site1.gtempurl.com/api/";
//var PhotoStorage = "http://technocrat92-001-site1.gtempurl.com/";
// var url_prifix = 'http://localhost:8000/';
angular.module('technocrat', ['ui.router', 'ui.bootstrap', 'authModule', 'app.controllers',
    'login.controllers', 'APIModule', 'placedashboard.controllers', 'angucomplete',
    'form.addcustomform', 'formsdashboard.controllers', 'addRepresentative.controllers', 'ngFileUpload',
    'representativeDashboard.controllers', 'activitiesDashboard.controllers', 'addPlaceCtrl.controllers', 'mp.datePicker', 'addProduct.controllers',
    'addCategory.controllers', 'dialog.controllers', 'homeNews.controllers', 'productDetail.controllers',
    'newRetailAudit.controllers', 'retailAuditsLIst.controllers', 'updateCategory.controllers', 'productLIst.controllers'])

    .run(function ($rootScope, $state, AuthService) {
        if (localStorage.getItem('isLoggedIn') === 'success') {
            $state.go('app.placedashboard');
        }
        else {
            $state.transitionTo('login');
        }
        $rootScope.$on("$stateChangeStart", function (event, toState, toParams, fromState, fromParams) {

        });
    })

    .config(function ($httpProvider) {
        $httpProvider.interceptors.push('genericInterceptor');

    })

    .factory('genericInterceptor', function ($q, $rootScope) {
        var interceptor = {
            'request': function (config) {
                // Successful request method
                $rootScope.loadCompetition = true;
                var data = localStorage.getItem('token');
                if (localStorage.getItem('token')) {
                    config.headers['x-access-token'] = data;
                }
                return config; // or $q.when(config);
            },
            'response': function (response) {
                // Successful response
                $rootScope.loadCompetition = false;
                return response; // or $q.when(config);
            },
            'requestError': function (rejection) {
                // An error happened on the request
                // if we can recover from the error
                // we can return a new request
                // or promise
                $rootScope.loadCompetition = false;
                return response;
                // Otherwise, we can reject the next
                // by returning a rejection
                // return $q.reject(rejection);
            },
            'responseError': function (rejection) {

                // Returning a rejection
                $rootScope.loadCompetition = false;
                return rejection;
            }
        };
        return interceptor;
    }).constant("TypesOfInputs",
    {
        TypesOfInputs: {
            textbox: 1,
            textarea: 2,
            datepicker: 3,
            photo: 4,
            checkbox: 5,
            list: 6,
            header: 7,
            product: 8,
            numeric: 9,
            barcode: 10
        }
    }
    )


    .config(function ($stateProvider, $urlRouterProvider) {
        $stateProvider

            .state('app', {
                url: '/app',
                abstract: true,
                templateUrl: './PartialViews/partials/main.html',
                controller: 'AppCtrl'
            })


            .state('app.activitiesDashboard', {
                url: '/activitiesDashboard',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/activitiesDashboard.html',
                        controller: 'activitiesDashboardCtrl'
                    }
                }
            })

            .state('app.place', {
                url: '/place/:data',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/AddPlace.html',
                        controller: 'addPlaceCtrl'
                    }
                }
            })
            .state('app.customforms', {
                url: '/customforms/:data',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/addcustomforms.html',
                        controller: 'addcustomformCtrl'
                    }
                }
            })

            .state('app.representativeDashboard', {
                url: '/representativeDashboard',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/representativeDashboard.html',
                        controller: 'representativeDashboardCtrl'
                    }
                }
            })

            .state('app.addProduct', {
                url: '/addProduct',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/addProduct.html',
                        controller: 'addProductCtrl'
                    }
                }
            }).state('app.addRepresentative', {
                url: '/addRepresentative/:data',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/AddRepresentatives.html',
                       
                        controller: 'addRepresentativeController'
                    }
                }
            })


            .state('app.placedashboard', {
                url: '/placedashboard',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/placedashboard.html',
                        controller: 'placedashboardCtrl'
                    }
                }
            })

            .state('app.formsdashboard', {
                url: '/formsdashboard',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/formsdashboard.html',
                        controller: 'formsdashboardCtrl'
                    }
                }
            })

            .state('app.homeSlider', {
                url: '/homeSlider',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/homeSlider.html',
                        controller: 'HomeSliderCtrl'
                    }
                }
            })

            .state('app.category', {
                url: '/category',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/category.html',
                        controller: 'CategoryCtrl'
                    }
                }
            })

            .state('app.categoryTreeUI', {
                url: '/categoryTreeUI',
                authenticate: true,
                params: {
                    categoryItems: null
                },
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/categoryTreeUI.html',
                        controller: 'CategoryItemCtrl'
                    }
                }
            })
            .state('app.addCategory', {
                url: '/addCategory',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/addCategory.html',
                        controller: 'AddCategoryCtrl'
                    }
                }
            })

            .state('app.updateCategory', {
                url: '/updateCategory',
                authenticate: true,
                params: {
                    categoryObj: null
                },
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/updateCategory.html',
                        controller: 'UpdateCategoryCtrl'
                    }
                }
            })

            .state('app.rationList', {
                url: '/rationList',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/rationList.html',
                        controller: 'RationListCtrl'
                    }
                }
            })

            .state('app.filter', {
                url: '/filter',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/filter.html',
                        controller: 'FilterCtrl'
                    }
                }
            })

            .state('app.productDetail', {
                url: '/productDetail',
                authenticate: true,
                params: {
                    data: null
                },
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/productDetail.html',
                        controller: 'ProductDetailCtrl'
                    }
                }
            })

            .state('app.updateProduct', {
                url: '/updateProduct/:data',
                authenticate: true,

                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/updateProduct.html',
                        controller: 'UpdateProductCtrl'
                    }
                }
            })

            .state('app.services', {
                url: '/services',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/services.html',
                        controller: 'ServicesCtrl'
                    }
                }
            })

           

            .state('app.dialog', {
                url: '/dialog',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/dialog.html',
                        controller: 'dialogCtrl'
                    }
                }
            })

            .state('app.homeNews', {
                url: '/homeNews',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/homeNews.html',
                        controller: 'homeNewCtrl'
                    }
                }
            })

            .state('app.newRetailAudit', {
                url: '/newRetailAudit',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/NewRetailAudit.html',
                        controller: 'NewRetailAuditCtrl'
                    }
                }
            })

            .state('app.productLIst', {
                url: '/productLIst',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/productLIst.html',
                        controller: 'productLIstCtrl'
                    }
                }
            })

            .state('app.retailAuditsLIst', {
                url: '/retailAuditsLIst',
                authenticate: true,
                views: {
                    'container': {
                        templateUrl: './PartialViews/partials/RetailAudits_List.html',
                        controller: 'RetailAuditsLIstCtrl'
                    }
                }
            })

            .state('login', {
                url: '/login',
                templateUrl: './PartialViews/partials/login.html',
                controller: 'LoginController'
            });

    });
