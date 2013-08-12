class NavigationView.Base extends Backbone.Marionette.Layout
  template: 'navigation'

  regions:
    container:
      selector: '.navigation-view__container'
      regionType: NavigationView.Region

  initialize: ->
    @views = new NavigationView.ViewsController()
    @listenTo @views, 'change', @onViewChange
    @listenTo @views, 'change', @updateRegions

  popView: ->
    @views.pop()

  pushView: (view) ->
    @views.push view

  clearViews: ->
    @views.clear()

  closeRegions: =>
    @container.close()

  updateRegions: (view, options) ->
    return unless view
    @container.show view, options.direction
