# From bootstrap 3 RC1

transitionEnd = ->
  el = document.createElement("bootstrap")

  transEndEventNames =
    WebkitTransition: "webkitTransitionEnd"
    MozTransition: "transitionend"
    OTransition: "oTransitionEnd otransitionend"
    transition: "transitionend"

  for name of transEndEventNames
    return end: transEndEventNames[name]  if el.style[name] isnt `undefined`

$.fn.emulateTransitionEnd = (duration) ->
  called = false
  $(this).one "webkitTransitionEnd", -> called = true
  callback = => $(this).trigger "webkitTransitionEnd" unless called
  setTimeout callback, duration
  this

$ ->
  $.support.transition = transitionEnd()
