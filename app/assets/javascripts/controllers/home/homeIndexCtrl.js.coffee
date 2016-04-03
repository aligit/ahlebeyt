@HomeCtrl = ["$scope", "$location", "$http", "$sce", ($scope, $location, $http, $sce) ->

  $scope.data =
    events: [{title: 'Loading events...', contents: ''}]

  date      = new Date()
  latitude  = 46.1983922
  longitude = 6.1422961
  timezone  = 1
  #From autumn until spring dst must be zero and one otherwise TODO
  dst       = 1 #from around 30 march
  # dst       = 0# 0 from around 25 October
  #From autumn until spring dst must be zero and one otherwise TODO
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
  $scope.sunset      = times['sunset']
  $scope.asr      = times['asr']
  $scope.maghrib  = times['maghrib']
  $scope.isha  = times['isha']
]


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
