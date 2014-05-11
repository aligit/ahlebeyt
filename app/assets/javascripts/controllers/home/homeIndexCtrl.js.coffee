
@HomeCtrl = angular.module("Home", [])
@HomeCtrl = ($scope) ->
  $scope.entries = [
    {name: "Larry"}
    {name: "Pierre"}
    {name: "Moe"}
  ]

  $scope.addEntry = ->
    $scope.entries.push($scope.newEntry)
    $scope.newEntry = {}
