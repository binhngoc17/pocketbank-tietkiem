class ChangeLongTextFieldToText < ActiveRecord::Migration
  def up
    change_column :products, :description, :text
    change_column :products, :issuance_condition, :text
    change_column :credits, :cash_back_rate_description, :text
  end

  def down
    change_column :products, :description, :string
    change_column :products, :issuance_condition, :string
    change_column :credits, :cash_back_rate_description, :string
  end
end
