pubApp.controller 'AdminDrinksCtrl', ['$scope', '$http', ($scope, $http) ->
  $http.get('/admin/drinks.json').success (drinks) ->
    $scope.drinks = drinks
    $scope.sortType = 'name'
    $scope.sortReverse = false

  $scope.changeStock = (drink) ->
    $http.post('/admin/drinks/changestock.json', id: drink.id)
      .success (response) ->
        drink.instock = !drink.instock
      .error (error) ->
        alert 'Något gick fel vid uppdateringen...'
]

