window.POCBANK["debits"] =
  index: () ->
    class Debit extends Backbone.Model
      urlRoot: "/admin/debits"

    class PageableDebits extends Backbone.PageableCollection
      state:
        pageSize: 20
        totalRecords: $("#datatable").data('count')
      model: Debit
      url: "/admin/debits"

    SLNS.debits = new PageableDebits()
    debits = SLNS.debits
    columns = [
      name: "name"
      label: "Name"
      editable: false
      cell: "string"
    ,
      name: "domestic_internal_cash_withdrawal_fee"
      label: "Phi rut tien"
      editable: false
      cell: "string"
    ,
      name: "primary_card_annual_fee"
      label: "Phi thuong nien"
      editable: false
      cell: "string"
    ,
      name: "currency_exchange_fee"
      label: "Phi chuyen doi ngoai te"
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
      collection: debits

    paginator = new Backgrid.Extension.Paginator
      collection: debits

    filter = new Backgrid.Extension.ServerSideFilter
      collection: debits
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

    debits.fetch()
