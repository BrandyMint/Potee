Potee.Views.Timelines ||= {}

class Potee.Views.Timelines.DaysView extends Backbone.View
  template: JST["backbone/templates/timelines/days"]

  tagName: 'div'
  className: 'days'

  initialize: (options) ->
    start = moment(options.date_start, "YYYY-MM-DD")
    end   = moment(options.date_finish, "YYYY-MM-DD")
    @range = moment().range(start, end);
    @column_width = options.column_width - 1

  days: () ->
    days = []
    # iterate by 1 day
    @range.by "d", (moment) ->
      # TODO Незнаю ка тут и что писать но надо это делать так
      # чтобы это не влияло на ширину колонок
      days.push moment.format("Do")
      # days.push(moment.format("dddd, MMMM Do"))
    days

  set_column_width: () ->
    @$el.find('table td').attr('width', @column_width + "px")

  render: =>
    $(@el).html(@template(days: @days()))
    @set_column_width()
    return this
