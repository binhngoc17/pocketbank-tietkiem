class ProvidersController < ApplicationController
  def credit_show
    @provider = Provider.find(params[:id])
    @credit_count = Credit.joins(:product).where("products.provider_id = ?", @provider.id).count
    @debit_count = Debit.joins(:product).where("products.provider_id = ?", @provider.id).count
    @credits = Credit.joins(:product).where("products.provider_id = ?", @provider.id)
    @credits = @credits.search(params[:q]).result
  end

  def debit_show
    @provider = Provider.find(params[:id])
    @credit_count = Credit.joins(:product).where("products.provider_id = ?", @provider.id).count
    @debit_count = Debit.joins(:product).where("products.provider_id = ?", @provider.id).count
    @debits = Debit.joins(:product).where("products.provider_id = ?", @provider.id)
    @debits = @debits.search(params[:q]).result
  end

  def redirect
    @provider = Provider.find(params[:id])

    @redirect_to = @provider.link

    render :layout => "layouts/redirect"
  end
end
