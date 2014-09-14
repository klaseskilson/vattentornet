# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(window).on "scroll", ->
    $(".pages.home #main-header").toggleClass "transparent", $(window).scrollTop() < ($("#big-img .wall-logo").offset().top) * .625
