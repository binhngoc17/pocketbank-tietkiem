class Admin::DebitsController < ::AdminController
  def new
    @debit = Debit.new
  end

  def create
    @debit = Debit.new(debit_params)
    if @debit.save
      redirect_to admin_debits_path, :notice => "Debit was successfully created."
    else
      render :action => :new
    end
  end

  def index
    respond_to do |format|
      format.html { }
      format.json do 
        if params[:query] and !params[:query].blank?
          @debits = Debit.joins(:product).order("products.name asc").query(params[:query]).paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        else
          @debits = Debit.joins(:product).order("products.name asc").paginate(:page => params[:page], :per_page => params[:per_page] || 30)
        end
      end
    end
  end

  def edit
    @debit = Debit.find(params[:id])
    render :action => :new
  end

  def update
    @debit = Debit.find(params[:id])
    up = debit_params
    up.delete(:password_confirmation) if debit_params[:password].blank?
    up.delete(:password) if debit_params[:password].blank?

    if @debit.update_attributes(up)
      redirect_to admin_debits_path, :notice => "Debit was successfully updated."
    else
      render :action => :new
    end
  end

  def destroy
    @debit = Debit.find(params[:id])
    @debit.destroy
  end

  private
  def debit_params
    params.require(:debit).permit(:name, :image, :link, :provider_id, :recommended, :has_promotion, :description,
        :primary_card_annual_fee, :sub_card_annual_fee, :issuance_fee, :domestic_internal_cash_withdrawal_fee, 
        :domestic_internal_cash_withdrawal_fee_description, :domestic_external_cash_withdrawal_fee,
        :domestic_external_cash_withdrawal_fee_description, :issuance_condition, :internal_transaction_fee, 
        :internal_transaction_fee_description, :external_transaction_fee, :external_transaction_fee_description,
        :daily_withdrawal_limit, :withdrawal_limit, :daily_expense_limit, :expense_limit, :daily_transaction_limit,
        :transaction_limit, :brand, :card_rank, :currency_exchange_fee, :currency_exchange_fee_desc)
  end
end
