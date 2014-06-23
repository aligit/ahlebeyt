@EventCtrl = ["$scope", "$routeParams", "$http", "$sce", ($scope, $routeParams, $http, $sce) ->

  $scope.data = 
    event: {title: 'My first post', contents: 'Lorem adipiscing id lacus. Aenean iaculis nulla justo.'}

  loadEventv = (eventId) ->
    $http.get('../events/'+eventId+'.json').success( (data) ->
      $scope.data.event = data
      console.log('Successfully loaded event.')
    ).error( ->
      console.error('Failed to load event.')
    )

  $scope.renderHtml = (html_code) ->
    $sce.trustAsHtml(html_code)

  loadEventv($routeParams.eventId)

  $scope.data.eventId = $routeParams.eventId
  console.log($routeParams)
]
