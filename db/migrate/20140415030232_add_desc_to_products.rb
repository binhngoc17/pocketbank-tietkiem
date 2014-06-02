class AddDescToProducts < ActiveRecord::Migration
  def change
    add_column :products, :currency_exchange_fee_desc, :string
  end
end
