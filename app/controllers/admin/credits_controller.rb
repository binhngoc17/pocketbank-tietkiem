class Admin::CreditsController < ::AdminController
  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to admin_credits_path, :notice => "Credit was successfully created."
    else
      render :action => :new
    end
  end

  def index
    respond_to do |format|
      format.html { }
      format.json do 
        if params[:query] and !params[:query].blank?
          @credits = Credit.joins(:product).order("products.name asc").query(params[:query]).paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        else
          @credits = Credit.joins(:product).order("products.name asc").paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        end
      end
    end
  end

  def edit
    @credit = Credit.find(params[:id])
    render :action => :new
  end

  def update
    @credit = Credit.find(params[:id])

    if @credit.update_attributes(credit_params)
      redirect_to admin_credits_path, :notice => "Credit was successfully updated."
    else
      render :action => :new
    end
  end

  def destroy
    @credit = Credit.find(params[:id])
    @credit.destroy
  end

  private
  def credit_params
    params.require(:credit).permit(:name, :image, :link, :provider_id, :recommended, :has_promotion, :description,
        :primary_card_annual_fee, :sub_card_annual_fee, :issuance_fee, :domestic_internal_cash_withdrawal_fee, 
        :domestic_internal_cash_withdrawal_fee_description, :domestic_external_cash_withdrawal_fee,
        :domestic_external_cash_withdrawal_fee_description, :issuance_condition, :reward_point, :reward_card,
        :cash_back_rate, :finance_charge_per_year, :advance_fee_at_ATM, :interest_free_day, :credit_limit, :expiry_period,
        :cash_back_rate_description, :late_charge, :cash_advance_fee, :currency_exchange_fee, :currency_exchange_fee_desc, :brand, :card_rank)
  end
end
