Potee.Views.TopPanel = {}

class Potee.Views.TopPanel.ProjectDetailView extends Marionette.ItemView
  template: "templates/top_panel/project_detail_view"

  ui:
    form: "form"
    title: "input#title"
    submitButton: "#submit-btn"
    cancelButton: "#cancel-btn"

  bindings:
    "#title":
      observe: "title"
      updateModel: false
      onGet: (val) ->
        # Корректно выводим спецсимволы
        _.unescape val

  events:
    "focus @ui.title"        : "showControlButtons"
    "keyup @ui.title"        : "checkChanges"
    "blur @ui.title"         : "hideControlButtons"
    "click @ui.submitButton" : "saveChanges"
    "click @ui.cancelButton" : "cancelChanges"
    "submit @ui.form"        : "saveChanges"

  saveChanges: (e) ->
    e.preventDefault()
    e.stopPropagation()

    $el = $(e.target)
    return if $el.attr "disabled"
    
    # Все знаки переводим в безопасные спецсимволы
    @model.set "title", _.escape @ui.title.val()
    @model.save(null,
      success : (project) =>
        @model = project
        #window.dashboard.view.cancelCurrentForm()
        @model.view.setTitleView "show"
        PoteeApp.seb.fire "project:current", undefined
    )

  cancelChanges: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @ui.title.val @model.get "title"

  showControlButtons: (e) ->
    $el = $(e.target)

    $("#control-buttons").removeClass "hidden"

    unless $el.val() is @model.get "title"
      $("#cancel-btn").removeClass "hidden"

  checkChanges: (e) ->
    $el = $(e.target)
    
    if $el.val() is @model.get "title"
      $("#submit-btn").attr 'disabled', 'disabled'
      $("#cancel-btn").addClass "hidden"
    else
      $("#submit-btn").removeAttr 'disabled'
      $("#cancel-btn").removeClass "hidden"

  hideControlButtons: ->
    setTimeout ->
      $("#control-buttons").addClass "hidden"
    , 100

  onRender: ->
    @stickit()