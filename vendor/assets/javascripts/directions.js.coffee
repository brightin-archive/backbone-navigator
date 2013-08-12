NavigationView.directionBack =
  name: 'back'
  inverse: 'next'
  removeViewAfterHide: true
  prepareView: (view) -> view.delegateEvents()

NavigationView.directionNext =
  name: 'next'
  inverse: 'back'
  removeViewAfterHide: false
  prepareView: (view) -> view.render()

NavigationView.nullDirection =
  name: ''
  inverse: ''
  removeViewAfterHide: false
  prepareView: (view) -> view.render()
