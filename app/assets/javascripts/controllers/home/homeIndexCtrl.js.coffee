@HomeCtrl = ($scope, $location, $http, $sce) ->

  $scope.data =
    events: [{title: 'Loading events...', contents: ''}]

  loadEvents = ->
    $http.get('../events/upcomings.json').success( (data) ->
      $scope.data.events = data
      console.log('Successfully loaded events.')
    ).error( ->
      console.error('Failed to load events.')
    )

  loadEvents()

  $scope.viewEvent = (eventId) ->
    $location.url('/event/'+eventId)

  $scope.renderHtml = (html_code) ->
    $sce.trustAsHtml(html_code)

# @HomeCtrl = ($scope) ->
#   $scope.entries = [
#     {name: "Larry"}
#     {name: "Pierre"}
#     {name: "Moe"}
#     {name: "Maman"}
#   ]
#
#   $scope.addEntry = ->
#     $scope.entries.push($scope.newEntry)
#     $scope.newEntry = {}
