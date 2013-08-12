class NavigationView.RegionWrapper extends Backbone.Marionette.ItemView

  initialize: (options) ->
    {@originalView} = options

  animateIn: (direction) ->
    @originalView.isActive = true
    @setClass direction.name
    @el.offsetWidth
    @setClass 'transition'

  animateOut: (direction) ->
    @originalView.isActive = false
    @setClass "transition #{direction.inverse}"
    @$el
      .one($.support.transition.end, => @close(direction.removeViewAfterHide))
      .emulateTransitionEnd(300)

  setClass: (classes) ->
    @$el.attr 'class', "region #{classes}"

  close: (removeOriginalAfterHide = true) ->
    if removeOriginalAfterHide && !@originalView.isActive
      @originalView.close()
    super

  render: (direction) ->
    direction.prepareView(@originalView)
    @$el.html @originalView.el
    this
