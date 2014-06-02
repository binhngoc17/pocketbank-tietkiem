# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require underscore
#= require lunr
#= require backbone
#= require backbone-pageable
#= require backgrid
#= require jquery.dcjqaccordion.2.7
#= require hover-dropdown
#= require jquery.scrollTo.min
#= require jquery.nicescroll
#= require bootstrap-datepicker/js/bootstrap-datepicker
#= require bootstrap-inputmask/bootstrap-inputmask
#= require respond.min
#= require admin/backgrid-custom
#= require backgrid-ext/paginator/backgrid-paginator
#= require backgrid-ext/filter/backgrid-filter
#= require common-scripts
#= require_self
#= require_directory .


window.POCBANK =
  common:
    init: () ->
      # sth here
      console.log ""
      $('.default-date-picker').datepicker({ format: "yyyy-mm-dd" })


UTIL =
  exec: (controller, action) ->
    ns = POCBANK
    action = ((if action is `undefined` then "init" else action))
    ns[controller][action]()  if controller isnt "" and ns[controller] and typeof ns[controller][action] is "function"

  init: ->
    body = document.body
    controller = body.getAttribute("data-controller")
    action = body.getAttribute("data-action")
    UTIL.exec "common"
    UTIL.exec controller
    UTIL.exec controller, action


$(document).ready UTIL.init
