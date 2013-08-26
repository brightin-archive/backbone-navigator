window.NavigationView ||= {}

class NavigationView.Region extends Backbone.Marionette.Region
  show: (newView, direction) ->
    @ensureEl()
    @setNewView(newView)
    @setDirection(direction)
    @render()
    @triggerEvents(newView)

  setNewView: (newView) ->
    @newView = new NavigationView.RegionWrapper(originalView: newView)

  setDirection: (direction) ->
    @direction = if @currentView then direction else NavigationView.nullDirection

  render: ->
    @$el.append @newView.render(@direction).el
    @animate()
    @currentView = @newView

  animate: ->
    @newView.animateIn @direction
    @currentView?.animateOut @direction

  triggerEvents: (view) ->
    Marionette.triggerMethod.call(this, "show", view)
    Marionette.triggerMethod.call(view, "show")
