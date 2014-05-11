#= require_self
#= require_tree ./services/global
#= require_tree ./services/home
#= require_tree ./filters/global
#= require_tree ./filters/home
#= require_tree ./controllers/global
#= require_tree ./controllers/home
#= require_tree ./directives/global
#= require_tree ./directives/home

# "Home" is the name of ng-app that is used in the view at
# /home/index.html.erb
@HomeCtrl = angular.module("Home", [])

# Sets up routing
@HomeCtrl.config(['$routeProvider', ($routeProvider) ->
  # Route for '/post'
  $routeProvider.when('/post', { templateUrl: '../assets/mainPost.html', controller: 'PostCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl:
  '../assets/mainIndex.html', controller: 'IndexCtrl' } )

      ])

