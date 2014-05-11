@HomeCtrl = angular.module("Home", [])
@HomeCtrl = ($scope) ->
  $scope.entries = [
    {name: "Larry"}
    {name: "Curly"}
    {name: "Moe"}
  ]

  $scope.addEntry = ->
    $scope.entries.push($scope.newEntry)
    $scope.newEntry = {}

