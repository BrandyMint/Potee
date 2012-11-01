class Potee.Models.Event extends Backbone.Model
  paramRoot: "event"

  defaults:
    title: "Some event"

  initialize: ->
    @date = moment(@get("date")).toDate()
    @time = moment(@get("time")).toDate()
    @project = @collection.project
    @project_started_at = @collection.project.started_at
    @setPassed()

  setPassed: ->
    @passed = moment(@get('date')).diff(moment()) < 0

  setDateTime: (datetime) ->
    @set("date", datetime.toDate())
    @set("time", datetime.toDate())
    @setPassed()
    @view.rerender()

  toTemplate: ->
    @toJSON()

class Potee.Collections.EventsCollection extends Backbone.Collection
  model: Potee.Models.Event
  url: '/events'

  initialize: (options) ->
    @on 'remove', (model) ->
      model.destroy()
    @project = options.project