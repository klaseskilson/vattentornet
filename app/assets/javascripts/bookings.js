// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var calendar = angular.module('calendar', []);

calendar.controller('calendar-controller', function ($scope, $http) {
  $scope.desired_month = moment();
  $scope.changeMonth = function(x) {
    desired_month = moment().add(x, 'months')
  }

  $scope.month = {
    title: moment(),
    days: moment().daysInMonth()
  }

  $scope.bookings = $http.get('/bookings.json').
    success(function (data, status, headers, config){
      if(data)
        return data;
    });
});
