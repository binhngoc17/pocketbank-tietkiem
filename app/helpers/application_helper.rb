module ApplicationHelper

  def n2currency(num, nullable = false)
    return "" if nullable && num == NULL_VALUE

    number_to_currency(num, :unit => "", :separator => ",", :delimiter => ".", :precision => 0)
  end

  def n2percent(num, nullable = false)
    return "" if nullable && num == NULL_VALUE
    num ? number_to_percentage(num * 100, :precision => 2) : ""
  end

  def line_break_name(name)
    h(name).gsub(/\n/, "<br/>").html_safe
  end

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true, :no_intra_emphasis => true)
    markdown.render(text).html_safe
  end

  def product_tag_class(product)
    result = ""
    result += "recommended-item " if product.recommended
    result += "has-promotion-item " if product.has_promotion

    result
  end

  def credit_tag_class(credit, in_shortlist)
    result = product_tag_class(credit)
    result += "hidden " if !in_shortlist && @credit_shortlist && @credit_shortlist.to_a.any? { |c| c.id == credit.id }
  end

  def debit_tag_class(debit, in_shortlist)
    result = product_tag_class(debit)
    result += "hidden " if !in_shortlist && @debit_shortlist && @debit_shortlist.to_a.any? { |c| c.id == debit.id }
  end

end
