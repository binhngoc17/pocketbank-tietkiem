class DebitsController < ApplicationController
  def index
    return if search_provider { |id| provider_debits_path(id, :q => params[:q]) }
    @q = Debit.search(params[:q])

    if params[:q]
      @q.product_recommended_eq = true if (params[:q][:debit_features] == "recommended")
      @q.product_has_promotion_eq = true if (params[:q][:debit_features] == "promotion")
      @q.product_primary_card_annual_fee_eq = 0 if (params[:q][:debit_features] == "primary_card_annual_fee")
      @q.product_currency_exchange_fee_lt = 0.025 if (params[:q][:debit_features] == "currency_exchange_fee")
      @q.product_domestic_external_cash_withdrawal_fee_eq = 0 if (params[:q][:debit_features] == "domestic_external_cash_withdrawal_fee")
    end

    #sort
    if @q.sorts.empty?
      if @q.product_currency_exchange_fee_lt
        @q.sorts = 'product_currency_exchange_fee asc'
      else
        @q.sorts = 'product_name asc'
      end
    end


    @debit_shortlist = Debit.where(:id => (session[:debit_shortlist] || []))
    @debits_count = @q.result.count
    @debits = @q.result.paginate(:page => params[:page], :per_page => 15)
  end

  def show

  end

  def redirect
    @product = Debit.find(params[:debit_id])

    @redirect_to = @product.link

    render "shared/product_redirect", :layout => "layouts/redirect"
  end

  def add_to_shortlist
    @debit = Debit.find(params[:debit_id])
    session[:debit_shortlist] ||= []
    session[:debit_shortlist] << @debit.id unless session[:debit_shortlist].include?(@debit.id)
    head :no_content
  end

  def remove_from_shortlist
    @debit = Debit.find(params[:debit_id])

    session[:debit_shortlist] ||= []
    session[:debit_shortlist].delete @debit.id
    head :no_content
  end
end
