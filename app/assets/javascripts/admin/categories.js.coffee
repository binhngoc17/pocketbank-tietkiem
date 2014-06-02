window.POCBANK["categories"] =
  index: () ->
    class Category extends Backbone.Model
      urlRoot: "/admin/categories"

    class PageableCategories extends Backbone.PageableCollection
      state:
        pageSize: 20
        totalRecords: $("#datatable").data('count')
      model: Category
      url: "/admin/categories"

    SLNS.categories = new PageableCategories()
    categories = SLNS.categories
    columns = [
      name: "name"
      label: "Name"
      editable: false
      cell: "string"
    ,
      name: ""
      label: "Edit"
      editable: false
      headerCell: Backgrid.HeaderCell.extend
        className: "action-cell"
      cell: SLNS.EditButtonCell
    ,
      name: ""
      label: "Delete"
      editable: false
      headerCell: Backgrid.HeaderCell.extend
        className: "action-cell"
      cell: SLNS.DeleteButtonCell
    ]

    grid = new Backgrid.Grid
      columns: columns
      className: "data-table display table table-bordered table-striped dataTable backgrid table-hover"
      collection: categories

    paginator = new Backgrid.Extension.Paginator
      collection: categories

    filter = new Backgrid.Extension.ServerSideFilter
      collection: categories
      placeholder: "Filter"
      name: "query"
      className: "dataTables_filter"

    $("#datatable").append(filter.render().$el)
    $("#datatable").append(grid.render().$el)
    $("#datatable").append(paginator.render().$el)
    filter.$el.css
      float: "right"
      'margin-right': '20px'
      width: "30%"
    filter.$el.find('.input-prepend').addClass('input-group')
    filter.$el.find('.add-on').addClass('input-group-addon').removeClass('add-on')
    filter.$el.find('input').addClass('form-control')
    filter.$el.find('i.icon-search').addClass('fa fa-search').removeClass('icon-search')

    categories.fetch()
