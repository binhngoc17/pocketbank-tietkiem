window.SLNS or= {}

class SLNS.PasswordCell extends Backgrid.Cell
  editor: Backgrid.InputCellEditor.extend
    attributes:
      type: "password"
  formatter: _.extend({}, Backgrid.CellFormatter.prototype,
    fromRaw: (raw) ->
      raw = raw || ""
      return raw.replace(/./g, "*")
  )

  
class SLNS.DeleteButtonCell extends Backgrid.Cell
  template: _.template("<button class='btn btn-small btn-danger'>Delete</button>")
  events:
    click: "deleteRow"

  deleteRow: (e) ->
    e.preventDefault()
    if (confirm("Are you sure?"))
      @model.destroy()

  render: () ->
    @$el.html @template()
    @delegateEvents()
    this

class SLNS.EditButton extends Backbone.View
  tagName: "a"
  className: "btn-small btn btn-success"
  attributes: () ->
    return {
      href: @model.url() + "/edit"
    }

  render: () ->
    @$el.html "Edit"
    this


class SLNS.ShowButton extends Backbone.View
  tagName: "a"
  className: "btn-small btn btn-primary"
  attributes: () ->
    return {
      href: @model.url()
    }

  render: () ->
    @$el.html "Show"
    this

class SLNS.ShowButtonCell extends Backgrid.Cell
  initialize: () ->
    @button = new SLNS.ShowButton
      model: @model
    super
  render: () ->
    @$el.html @button.render().el
    this

class SLNS.EditButtonCell extends Backgrid.Cell
  initialize: () ->
    @button = new SLNS.EditButton
      model: @model
    super
  render: () ->
    @$el.html @button.render().el
    this

class SLNS.SelectFilter extends Backbone.View
  tagName: "select"

  events:
    change: "filter"

  name: "filter"

  initialize: (options) ->
    super options
    @name = options.name || @name
    @options = options.options
    @collection.queryParams[@name] = () =>
      @$el.val() || null
  
  render: () ->
    @$el.empty()
    _.each(@options, (opt, index) =>
      option = $("<option>").attr("value", opt[1]).html(opt[0])
      @$el.append(option)
    )
    @delegateEvents()
    this

  filter: () ->
    @collection.fetch({reset: true})

class SLNS.SaveButton extends Backbone.View
  tagName: "button"
  className: "btn btn-success pull-right"

  events:
    click: "saveChanges"

  initialize: () ->
    @collection.on "change", () ->
      @$el.html "Save Changes*"
    , this

  saveChanges: () ->
    @$el.html "Saving..."
    savingReqs = []
    _.each(@collection.models, (e) ->
      savingReqs.push(e.save()) if e.hasChanged()
    )
    $.when.apply($, savingReqs).done () =>
      @$el.html "Saved"
  
  render: () ->
    @$el.html "Save Changes"
    @delegateEvents()
    this
