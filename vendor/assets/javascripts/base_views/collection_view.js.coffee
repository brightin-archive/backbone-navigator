class Backbone.Navigator.CollectionView extends Backbone.Marionette.CollectionView
  delegateEvents: ->
    super
    @children.each (view) -> view.delegateEvents()
