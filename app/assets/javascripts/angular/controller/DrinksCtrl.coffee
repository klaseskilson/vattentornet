shorten = (text, limit) -> text.split(' ')[0..limit].join(' ')

@pubApp.controller 'DrinksCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.drink_types = []
  $scope.message = "Laddar drycker..."
  $scope.drinksSearch = ""

  $http.get('/sortiment.json')
  .success((data) ->
    $scope.message = ""
    $scope.last_updated = data.last_updated
    angular.forEach data.drink_list, (drink_type) ->
      unless drink_type.drinks.length is 0
        word_limit = 45
        if drink_type.description && drink_type.description.split(' ').length > word_limit
          drink_type.short_desc = shorten(drink_type.description, word_limit)
        $scope.drink_types.push(drink_type)
    return
  )
  .error(->
    $scope.message = "Ajdå! Vi kunde inte ladda in dryckerna. Prova att ladda om sidan, eller kontakta oss omedelbums!"
    return
  )

  $scope.show_description = (drink_type) ->
    return !drink_type.short_desc || drink_type.show_desc

  return
]
