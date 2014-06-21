@HomeCtrl = ($scope, $location, $http, $sce) ->

  $scope.data =
    events: [{title: 'Loading events...', contents: ''}]

  date      = new Date()
  latitude  = 46.1983922
  longitude = 6.1422961
  timezone  = 1
  dst       = 1
  method    = 'Tehran'
  azanlist = ['Fajr', 'Sunrise', 'Dhuhr', 'Asr', 'Maghrib', 'Isha', 'Midnight']
  prayTimes.setMethod(method)
  times = prayTimes.getTimes(date, [latitude, longitude], timezone,dst)
  console.log(times)

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

  $scope.fajr     = times['fajr']
  $scope.sunrise  = times['sunrise']
  $scope.dhuhr    = times['dhuhr']
  $scope.asr      = times['sunset']
  $scope.maghrib  = times['maghrib']


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
