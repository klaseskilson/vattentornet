jQuery ->
  $('.menu-toggle').on "click", ->
    $('#main-header').toggleClass "expanded"
  $('[data-tooltip]').tooltip()

@pubApp = angular.module('pubApp', [])
