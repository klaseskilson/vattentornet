pubApp.controller 'CalendarCtrl', ['$scope', '$http', ($scope, $http)->
  $scope.month = moment([moment().year(), moment().month()])
  $scope.days = []

  fetchMonth = ->
    $http.get "/bookings/month/#{$scope.month.year()}/#{$scope.month.month()+1}.json"
      .then (response)->
        $scope.days = makeArray response.data

  $scope.changeMonth = (x)->
    $scope.month = $scope.month.add(x, 'months')
    fetchMonth()

  makeArray = (bookings)->
    month = angular.copy $scope.month
    days = []
    for i in [0..$scope.month.daysInMonth()-1]
      day = angular.copy month
      day.add(i, 'days')

      booking = bookings.filter (booking)->
        return booking.date == day.format('YYYY-MM-DD')

      if booking.length > 0
        booking = booking[0]

      days.push
        weekday: day.weekday()
        day: i+1
        pub: if booking then booking.pub else false
        confirmed: if booking then booking.confirmed else false
        url: if booking then booking.url else false
        public: if booking then booking.public else false

    return days

  fetchMonth()
]
