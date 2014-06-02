window.POCBANK["users"] =
  index: () ->
    class User extends Backbone.Model
      urlRoot: "/admin/users"

    class PageableUsers extends Backbone.PageableCollection
      state:
        pageSize: 20
        totalRecords: $("#datatable").data('count')
      model: User
      url: "/admin/users"

    SLNS.users = new PageableUsers()
    users = SLNS.users
    columns = [
      name: "email"
      label: "Email"
      editable: false
      cell: "email"
    ,
      name: "name"
      label: "Name"
      editable: false
      cell: "string"
    ,
      name: "phone"
      label: "Phone"
      editable: false
      cell: "string"
    ,
      name: "role"
      label: "Role"
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
      collection: users

    paginator = new Backgrid.Extension.Paginator
      collection: users

    filter = new Backgrid.Extension.ServerSideFilter
      collection: users
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

    users.fetch()
