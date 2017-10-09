//var url_prifix = 'http://192.168.0.9:8000/';
// var url_prifix = 'http://localhost:8000/';
angular.module('technocrat', ['ui.router', 'ui.bootstrap', 'authModule', 'app.controllers',
    'login.controllers', 'APIModule', 'product.controllers', 'form.addcustomform','feedback.controllers'])

.run(function($rootScope, $state, AuthService){
    if(localStorage.getItem('isLoggedIn') === 'success'){
        $state.go('app.product');
    }
    else {
        $state.transitionTo('login');
    }
    $rootScope.$on("$stateChangeStart", function(event, toState, toParams, fromState, fromParams){
     
    });
})

.config(function($httpProvider) {
    $httpProvider.interceptors.push('genericInterceptor');
   
    })

.factory('genericInterceptor', function($q, $rootScope) {
    var interceptor = {
        'request': function(config) {
            // Successful request method
            $rootScope.loadCompetition = true;
            var data = localStorage.getItem('token');
            if (localStorage.getItem('token')) {
                config.headers['x-access-token'] = data;
            }
            return config; // or $q.when(config);
        },
        'response': function(response) {
            // Successful response
            $rootScope.loadCompetition = false;
            return response; // or $q.when(config);
        },
        'requestError': function(rejection) {
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
        'responseError': function(rejection) {
            
            // Returning a rejection
            $rootScope.loadCompetition = false;
            return rejection;
        }
    };
    return interceptor;
})


.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

  .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: './PartialViews/partials/main.html',
    controller: 'AppCtrl'
  })


  .state('app.orders', {
    url: '/users',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/orders.html',
        controller: 'OrdersCtrl'
      }
    }
      })
      .state('app.customforms', {
          url: '/customforms',
          authenticate: true,
          views: {
              'container': {
                  templateUrl: './PartialViews/partials/addcustomforms.html',
                  controller: 'addcustomformCtrl'
              }
          }
      })

  .state('app.userinvestment', {
    url: '/userinvestment',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/userinvestment.html',
        controller: 'UserinvestmentCtrl'
      }
    }
  })

  .state('app.addProduct', {
    url: '/addProduct',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/addProduct.html',
        controller: 'AddProductCtrl'
      }
    }
  })


  .state('app.product', {
    url: '/properties',
    authenticate: true,
    views: {
      'container': {
          templateUrl: './PartialViews/partials/product.html',
        controller: 'ProductCtrl'
      }
    }
  })

  .state('app.feedback', {
    url: '/feedback',
    authenticate: true,
    views: {
      'container': {
          templateUrl: './PartialViews/partials/feedback.html',
        controller: 'FeedbackCtrl'
      }
    }
  })

  .state('app.homeSlider', {
    url: '/homeSlider',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/homeSlider.html',
        controller: 'HomeSliderCtrl'
      }
    }
  })

  .state('app.category', {
    url: '/category',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/category.html',
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
        templateUrl: 'partials/categoryTreeUI.html',
        controller: 'CategoryItemCtrl'
      }
    }
  })
  .state('app.addCategory', {
    url: '/addCategory',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/addCategory.html',
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
        templateUrl: 'partials/updateCategory.html',
        controller: 'UpdateCategoryCtrl'
      }
    }
  })

  .state('app.rationList', {
    url: '/rationList',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/rationList.html',
        controller: 'RationListCtrl'
      }
    }
  })

  .state('app.filter', {
    url: '/filter',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/filter.html',
        controller: 'FilterCtrl'
      }
    }
  })

  .state('app.productDetail', {
    url: '/propertyDetail/:data',
    authenticate: true,
    params: {
      data: null
    },
    views: {
      'container': {
        templateUrl: 'partials/productDetail.html',
        controller: 'ProductDetailCtrl'
      }
    }
  })

  .state('app.updateProduct', {
    url: '/updateProduct/:data',
    authenticate: true,
   
    views: {
      'container': {
        templateUrl: 'partials/updateProduct.html',
        controller: 'UpdateProductCtrl'
      }
    }
  })

  .state('app.services', {
    url: '/services',
    authenticate: true,
    views: {
      'container': {
        templateUrl: 'partials/services.html',
        controller: 'ServicesCtrl'
      }
    }
  })

  .state('login', {
    url: '/login',
    templateUrl: './PartialViews/partials/login.html',
    controller: 'LoginController'
  });

});
