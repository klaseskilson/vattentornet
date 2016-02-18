jQuery ->
  $(window).on "scroll", ->
    logo_pos = $("#big-img .wall-logo").offset()
    # ensure that the big logo exists on current page before assuming so
    toggle_scroll = logo_pos && $(window).scrollTop() < logo_pos.top * .625
    $(".static_pages.home #main-header").toggleClass "transparent", toggle_scroll
