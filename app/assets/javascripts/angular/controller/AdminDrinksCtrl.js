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

pubApp.factory('beerinfo', function($http) {
  var endpoint = '/admin/drinks/beerinfo';
  return {
    getSearchResult: function(name) {
      return $http.post(endpoint, {name: name}).then(function(res) {
        return res;
      });
    }
  }
});

pubApp.controller('AdminAddDrinksCtrl', ['$scope', '$http', '$timeout', 'beerinfo', function ($scope, $http, $timeout, beerinfo) {
  var timeoutPromise;
  $scope.fillform = function(item, model, label) {
    console.log(item);
    $scope.beer = item.name;
    $scope.ABV = parseFloat(item.abv);
    $scope.brewery = item.brewery;
    $scope.beer = item.name;
  }
  $scope.getinfo = function(drinkname) {
    var delayInMs = 1500;
    $timeout.cancel(timeoutPromise);
    timeoutPromise = $timeout(function(){
        return beerinfo.getSearchResult(drinkname).then(function(resp) {
          return resp.data
        });
    }, delayInMs);
    return timeoutPromise;

  }
}]);

