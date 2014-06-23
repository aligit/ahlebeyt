#= require_self
#= require controllers/home/homeEventCtrl
#= require controllers/home/homeIndexCtrl
#= require PrayTimes

# "Home" is the name of ng-app that is used in the view at
# /home/index.html.erb
# @HomeCtrl = angular.module("Home", [])

# Sets up routing
# @HomeCtrl.config(['$routeProvider', ($routeProvider) ->
#   $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'HomeCtrl' } )
#   ])
# ...

# Creates new Angular module called 'Blog'
Blog = angular.module('Home', ['ngRoute'])

# Sets up routing
Blog.config(['$routeProvider', ($routeProvider) ->
#   # Route for '/event'
  $routeProvider.when('/event/:eventId', { templateUrl: '../assets/homeEvent.html', controller: 'EventCtrl' } )
#
#   # Default
  $routeProvider.otherwise({ templateUrl: '../assets/homeIndex.html', controller: 'HomeCtrl' } )
#
])
