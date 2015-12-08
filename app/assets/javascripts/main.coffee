jQuery ->
  $('.menu-toggle').on "click", ->
    $('#main-header').toggleClass "expanded"

@pubApp = angular.module('pubApp', ['ui.bootstrap'])

