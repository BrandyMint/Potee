Potee.Views.Titles ||= {}

class Potee.Views.Titles.ShowView extends Backbone.View
  template: JST["backbone/templates/titles/show"]
  tagName: "div"
  className: 'project-title'

  render: ->
    $(@el).html(@template(@options.project_view.model.toJSON() ))

    return this