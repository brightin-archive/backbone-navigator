class Backbone.Navigator.Layout extends Backbone.Marionette.Layout
  delegateEvents: ->
    super
    @regionManager.each (region) ->
      region.currentView?.delegateEvents()
