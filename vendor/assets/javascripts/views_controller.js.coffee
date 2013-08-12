class NavigationView.ViewsController extends Backbone.Marionette.Controller
  initialize: ->
    @views = []

  clear: ->
    return if @views.length == 0
    @views = []
    @triggerChange undefined, location: '', length: 0

  pop: ->
    @views.pop()
    @triggerChange @currentView(), direction: NavigationView.directionBack

  push: (view) ->
    return if @currentLocation() == window.location.hash
    return @pop() if @previousLocation() == window.location.hash
    @saveScrollPosition()
    @views.push @setView(view)
    @triggerChange view, direction: NavigationView.directionNext

  setView: (view) ->
    view.navigationView ||= {}
    view.navigationView.location = window.location.hash
    view

  saveScrollPosition: ->
    return unless @currentView()
    scrollTop = @currentView().$('.navigation-view__scroll').scrollTop()
    @currentView().navigationView.scrollPosition = scrollTop

  triggerChange: (view, options) ->
    options = _.extend(options, length: @views.length, view?.navigationView)
    @trigger 'change', view, options

  currentLocation: ->
    @currentView()?.navigationView?.location

  previousLocation: ->
    @views[@views.length - 2]?.navigationView?.location

  currentView: ->
    @views[@views.length - 1]
