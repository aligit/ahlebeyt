@EventCtrl = ($scope, $routeParams, $http) ->

  $scope.data = 
    event: {title: 'My first post', contents: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec laoreet lobortis vulputate. Ut tempus, orci eu tempor sagittis, mauris orci ultrices arcu, in volutpat elit elit semper turpis. Maecenas id lorem quis magna lacinia tincidunt. In libero magna, pharetra in hendrerit vitae, luctus ac sem. Nulla velit augue, vestibulum a egestas et, imperdiet a lacus.  Nam mi est, vulputate eu sollicitudin sed, convallis vel turpis. Cras interdum egestas turpis, ut vestibulum est placerat a. Proin quam tellus, cursus et aliquet ut, adipiscing id lacus. Aenean iaculis nulla justo.'}

  loadEventv = (eventId) ->
    $http.get('../events/19.json').success( (data) ->
      $scope.data.event = data
      console.log('Successfully loaded event.')
    ).error( ->
      console.error('Failed to load event.')
    )

  loadEventv()

  $scope.data.eventId = $routeParams.eventId
  console.log($routeParams)
