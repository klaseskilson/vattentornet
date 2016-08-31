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

pubApp.factory 'beerinfo', ['$http', ($http) ->
  endpoint = '/admin/drinks/beerinfo'
  { getSearchResult: (name) ->
    $http.post(endpoint, name: name).then (res) ->
      res
  }
]
pubApp.controller 'AdminAddDrinksCtrl', [
  '$scope'
  '$http'
  '$timeout'
  'beerinfo'
  ($scope, $http, $timeout, beerinfo) ->
    timeoutPromise = undefined

    $scope.init  = (name, brewery, abv, label) ->
      $scope.beer = name
      $scope.brewery = brewery
      $scope.ABV = parseFloat(abv)
      $scope.label_url = label

    $scope.fillform = (item, model, label) ->
      $scope.beer = item.name
      $scope.ABV = parseFloat(item.abv)
      $scope.brewery = item.brewery
      $scope.label_url = item.labelurl
      return

    $scope.getinfo = (drinkname) ->
      delayInMs = 550
      $timeout.cancel timeoutPromise
      timeoutPromise = $timeout((->
        beerinfo.getSearchResult(drinkname).then (resp) ->
          resp.data
      ), delayInMs)
      timeoutPromise

    return
]

