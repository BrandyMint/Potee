#= require hamlcoffee
#= require jquery
#= require jquery_ujs
#= require jquery.effects.bounce
#= require jquery.ui.resizable
#= require jquery.ui.draggable
#= require underscore/underscore
#= require momentjs/moment
#= require moment-range/lib/moment-range
#= require backbone/backbone
#= require backbone.marionette/lib/backbone.marionette
#= require backbone_rails_sync
#= require backbone_datalink

#= require_tree ./application/config
#= require application/potee
#= require bootstrap
#= require jGestures/jgestures
#= require_tree .

$ ->
  $('[rel=tooltip]').tooltip()
