
@HomeCtrl = ($scope) ->
  $scope.entries = [
    {name: "Larry"}
    {name: "Pierre"}
    {name: "Moe"}
    {name: "Maman"}
  ]

  $scope.addEntry = ->
    $scope.entries.push($scope.newEntry)
    $scope.newEntry = {}
