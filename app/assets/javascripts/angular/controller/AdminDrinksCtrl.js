pubApp.controller('AdminDrinksCtrl', ['$scope', '$http', function ($scope, $http) {
  $http.get('/admin/drinks.json').success(function(drinks){
    $scope.drinks = drinks;
  });

  $scope.changeStock = function(drink){
    $http.post('/admin/drinks/changestock.json', {id: drink.id}).success(function(response){
      drink.instock = !drink.instock;
    }).error(function(error){
      alert("Något gick fel vid uppdateringen...");
    });
  }
}]);
