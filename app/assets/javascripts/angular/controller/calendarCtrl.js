pubApp.controller('CalendarCtrl', function ($scope, $http) {
  $scope.month = moment(new Date());
  $scope.days = [];
  var bookings;

  $http.get('/bookings.json')
    .success(function (data, status, headers, config) {
      makeArray($scope.month.daysInMonth(), data)
      bookings = data;
    });

  $scope.changeMonth = function(x) {
    $scope.month = $scope.month.add(x, 'months');
    makeArray($scope.month.daysInMonth(), bookings);
  }

  function makeArray(i, bookings) {
    $scope.days = [];
    var pub = false;
    var confirmed = false;
    var public = false;
    var loopDate;
    for(var j=1; j<=i; j++) {
      loopDate = $scope.month.format("YYYY-MM-");
      var d = loopDate;
      if((j-1)<10) {
        loopDate += "0"+((j));
        d += "0"+(j);
      }
      else {
        loopDate += (j);
        d += j;
      }
      var n = bookings.length != 0 ? bookings.length : 1;
      for(var k = 0; k < n; k++) {
        bookings[k] = bookings[k] ? bookings[k] : {date: null}
        if( loopDate == bookings[k].date ) {
          pub = bookings[k].pub;
          confirmed = bookings[k].confirmed;
          public = bookings[k].public;
        }
        // This line is just a hotfix until interval booking is fixed
        else if((moment(loopDate).weekday() == 3 || moment(loopDate).weekday() == 4) && (moment(loopDate) < moment('2014-12-15') && moment(loopDate) > moment('2014-09-01'))){
          pub = true;
          confirmed = true;
          public = true;
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
