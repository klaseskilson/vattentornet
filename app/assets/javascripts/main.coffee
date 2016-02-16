jQuery ->
  $('.menu-toggle').on "click", ->
    $('#main-header').toggleClass "expanded"
  $('[data-tooltip]').tooltip()

  # the hacky slice call thingy converts a HTMLCollection to an array
  [].slice.call(document.forms).forEach (form) ->
    form.addEventListener 'submit', (e) ->
      e.currentTarget.classList.add 'submitted'

@pubApp = angular.module('pubApp', [])
