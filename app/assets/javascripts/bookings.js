// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var calendar = angular.module('calendar', []);

calendar.controller('calendarController', function ($scope, $http) {
  $scope.month = moment();
  var bookings
  $http.get('/bookings.json').
    success(function (data, status, headers, config){
      makeArray($scope.month.daysInMonth(), data)
      bookings = data;
    });

  $scope.changeMonth = function(x) {
    console.log("changeMonth")
    $scope.month = $scope.month.add(x, 'months')
    makeArray($scope.month.daysInMonth(), bookings)
  }

  function makeArray(i, bookings) {
    $scope.days = []
    var pub = false;
    var confirmed = false;
    var public = false;
    var loopDate;
    for(var j=1; j<=i; j++)
    {
      loopDate = $scope.month.format("YYYY-MM-");
      var d = loopDate
      if((j-1)<10)
      {
        loopDate += "0"+((j));
        d += "0"+(j);
      }
      else
      {
        loopDate += (j);
        d += j;
      }
      for(var k = 0; k < bookings.length; k++)
      {
        if ( moment(loopDate).weekday() == 3 || moment(loopDate).weekday() == 4 || loopDate == bookings[k].date )
        {
          pub = bookings[k].pub;
          confirmed = bookings[k].confirmed;
          public = bookings[k].public;
        }
      }
      $scope.days.push({
        weekday: moment(d).weekday(),
        day: (j),
        pub: pub,
        confirmed: confirmed,
        public: public
      });
      pub = false;
      confirmed = false;
      public = false;
    }
  }
});
