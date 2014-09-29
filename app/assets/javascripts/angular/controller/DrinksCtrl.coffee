@pubApp.controller 'DrinksCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.drink_types = []
  $scope.message = "Laddar drycker..."

  $http.get('/sortiment.json')
  .success((data) ->
    $scope.message = ""
    angular.forEach data, (drink_type) ->
      $scope.drink_types.push(drink_type) unless drink_type.drinks.length is 0
    return
  )
  .error(->
    $scope.message = "Ajdå! Vi kunde inte ladda in dryckerna. Prova att ladda om sidan, eller kontakta oss omedelbums!"
    return
  )
  return
]
