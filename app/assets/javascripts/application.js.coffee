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
#= require jquery.dcjqaccordion.2.7
#= require hover-dropdown
#= require jquery.hcsticky
#= require jquery.scrollTo.min
#= require jquery.nicescroll
#= require jquery.tooltipster
#= require respond.min
#= require chosen-jquery
#= require_self

$(document).ready () ->
  $(".checkbox-filter li, .checkbox-filter li label.fake-chk").click () ->
    $(this).find("input[type='checkbox']").trigger("click")
  $(".checkbox-filter li input[type='checkbox']").change () ->
    $(this).parent("li").addClass("active") if $(this).is(":checked")
    $(this).parent("li").removeClass("active") unless $(this).is(":checked")
    
  $("section.compare-panel").on "click", ".fullview-toggle", () ->
    $(this).parents(".product-item").next(".product-description").toggleClass("hidden")
    $(this).toggleClass("c-hidden")

  $(".provider-content").on "click", ".fullview-toggle", () ->
    $(this).parents(".row.item-row").next(".product-description").toggleClass("hidden")
    $(this).toggleClass("c-hidden")

  $(".filter-container").hcSticky(
    bottomEnd: 50
  )
  $("section.compare-panel .header-wrapper").hcSticky()

  $(".sort-by").hover(() ->
    $(".sort-by-selections").show()
  , () ->
    $(".sort-by-selections").hide()
  )

  $("section.compare-panel").on "click", ".shortlist-adder", () ->
    $pi = $(this).parents("section.product-item")
    $piDesc = $pi.next(".product-description")

    if (!$(this).hasClass("added"))
      $(this).addClass("added")
      if (!$pi.find(".fullview-toggle").hasClass("c-hidden"))
        $pi.find(".fullview-toggle").click()

      $pi.clone().appendTo("#shortlist")
      $piDesc.clone().appendTo("#shortlist")
      $pi.addClass("hidden")
      $piDesc.addClass("hidden")

      $(".shortlist-indicator span").data("count", $(".shortlist-indicator span").data("count") + 1)
      $(".shortlist-indicator span").html("#{$(".shortlist-indicator span").data("count")} thẻ")

      $.ajax({ url: "/#{$pi.data("type")}/#{$pi.data("item-id")}/shortlist", type: "POST" })
    else
      $("[data-item-id=#{$pi.data("item-id")}] .shortlist-adder").removeClass("added")
      $("[data-item-id=#{$pi.data("item-id")}]").removeClass("hidden")
      
      $("#shortlist [data-item-id=#{$pi.data("item-id")}]").next(".product-description").remove()
      $("#shortlist [data-item-id=#{$pi.data("item-id")}]").remove()

      $(".shortlist-indicator span").data("count", $(".shortlist-indicator span").data("count") - 1)
      $(".shortlist-indicator span").html("#{$(".shortlist-indicator span").data("count")} thẻ")
      $.ajax({ url: "/credits/#{$pi.data("item-id")}/shortlist", type: "DELETE" })

  $(".filter-body ul.check-filter > li").change (e) ->
    $(this).closest("form").submit()

  $(document).on "click", "button[data-href]", (e) ->
    window.open($(this).data("href"), '_blank')
    e.preventDefault()

  $(".filter-boxes > .filter-box.active select.chosen-select").chosen(
    width: "100%",
    allow_single_deselect: true,
    enable_split_word_search: true,
    search_contains: true
  )

  $(".filter-panel .selectbox-filter select.chosen-select").chosen(
    width: "100%",
    allow_single_deselect: true,
    enable_split_word_search: true,
    search_contains: true
  )

  $("ul.category-chooser > li").click (e) ->
    $("ul.category-chooser > li").removeClass("selected")
    $(this).addClass("selected")

    $(".filter-boxes > .filter-box").removeClass("active")
    $(".filter-boxes > .filter-box#{$(this).data("target")}").addClass("active")
    $(".filter-boxes > .filter-box#{$(this).data("target")} select.chosen-select").chosen(
      width: "100%",
      allow_single_deselect: true,
      enable_split_word_search: true,
      search_contains: true
    )

    $(".btn-search").focus()


  # Provider page
  $(".row.item-header").hcSticky()

  $('.tooltipster').tooltipster()
