class CreditsController < ApplicationController
  def index
    return if search_provider { |id| provider_credits_path(id, :q => params[:q]) }
    @q = Credit.search(params[:q])

    if params[:q]
      @q.product_recommended_eq = true if (params[:q][:credit_features] == "recommended")
      @q.product_has_promotion_eq = true if (params[:q][:credit_features] == "promotion")
      @q.product_primary_card_annual_fee_eq = 0 if (params[:q][:credit_features] == "primary_card_annual_fee")
      @q.product_currency_exchange_fee_lt = 0.025 if (params[:q][:credit_features] == "currency_exchange_fee")
      @q.reward_card_eq = true if (params[:q][:credit_features] == "reward_card")
    end

    #sort
    if @q.sorts.empty?
      if @q.product_currency_exchange_fee_lt
        @q.sorts = 'product_currency_exchange_fee asc'
      else
        @q.sorts = 'product_name asc'
      end
    end

    @credit_shortlist = Credit.where(:id => (session[:credit_shortlist] || []))
    @credits_count = @q.result.count
    @credits = @q.result.paginate(:page => params[:page], :per_page => 15)
  end

  def show

  end

  def redirect
    @product = Credit.find(params[:credit_id])

    @redirect_to = @product.link

    render "shared/product_redirect", :layout => "layouts/redirect"
  end

  def add_to_shortlist
    @credit = Credit.find(params[:credit_id])
    session[:credit_shortlist] ||= []
    session[:credit_shortlist] << @credit.id unless session[:credit_shortlist].include?(@credit.id)
    head :no_content
  end

  def remove_from_shortlist
    @credit = Credit.find(params[:credit_id])

    session[:credit_shortlist] ||= []
    session[:credit_shortlist].delete @credit.id
    head :no_content
  end

end
