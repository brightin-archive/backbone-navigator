# Backbone Navigator

Backbone Navigator gives you the ability to simple pop and push views to a Marionette region. Features:

- Customisable CSS3 transitions
- Navigator saves old views so you can create a back button
- Makes sure no zombie views exist

## Usage

Add the following to your gemfile:

    gem 'backbone-navigator'

Add the following directive to your Javascript manifest file (application.js):

    //= require backbone-navigator

## CSS Animations

The region element gets additional classes (`.back`, `.next` and `.transition`). For example:

```sass
.region
  @include transform
  &.back
    @include transform(-100%)
  &.next
    @include transform(100%)
  &.transition
    @include transition
```
