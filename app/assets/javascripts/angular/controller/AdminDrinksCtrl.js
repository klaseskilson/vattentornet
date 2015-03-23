pubApp.controller('AdminDrinksCtrl', ['$scope', '$http', function ($scope, $http) {
  $http.get('/admin/drinks.json').success(function(drinks){
    console.log(drinks)
    $scope.drinks = drinks;

  });
}]);
