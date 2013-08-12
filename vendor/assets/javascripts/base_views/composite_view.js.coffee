class Backbone.Navigator.CompositeView extends Backbone.Marionette.CompositeView
  delegateEvents: ->
    super
    @children.each (view) -> view.delegateEvents()
