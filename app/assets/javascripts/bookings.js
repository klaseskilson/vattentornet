// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var calendar = angular.module('calendar', []);

calendar.controller('calendarController', function ($scope, $http) {
  $scope.month = moment();
  var bookings = $http.get('/bookings.json').
    success(function (data, status, headers, config){
      makeArray($scope.month.daysInMonth(), data)
      return data;
    });

  $scope.changeMonth = function(x) {
    console.log("TJENA")
    $scope.month = $scope.month.add(x, 'months')
    console.log($scope.month)
    makeArray($scope.month.daysInMonth(), bookings)
  }

  function makeArray(i, bookings) {
    $scope.days = []
    var pub = false;
    var confirmed = false;
    for(var j=0; j<i; j++)
    {
      var loopDate = $scope.month.format("YYYY-MM-")
      if(j<10)
        loopDate += "0"+j;
      else
        loopDate += j;
      for(var k = 0; k < bookings.length; k++)
      {
        if ( loopDate == bookings[k].date )
        {
          pub = bookings[k].pub;
          confirmed = bookings[k].confirmed;
        }
      }
      console.log(moment(loopDate).weekday())
      $scope.days.push({
        weekday: moment(loopDate).weekday(),
        day: (j+1),
        pub: pub,
        confirmed: confirmed
      });
      pub = false;
      confirmed = false;
    }
  }

});
