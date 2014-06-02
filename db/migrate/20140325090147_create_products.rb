class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, :as_relation_superclass => true do |t|
      t.references :provider, index: true
      t.string :image
      t.string :link
      t.string :name
      t.boolean :recommended
      t.boolean :has_promotion
      t.text :description
      t.integer :primary_card_annual_fee, :limit => 8
      t.integer :sub_card_annual_fee, :limit => 8
      t.integer :issuance_fee, :limit => 8
      t.integer :domestic_internal_cash_withdrawal_fee, :limit => 8
      t.string :domestic_internal_cash_withdrawal_fee_description
      t.integer :domestic_external_cash_withdrawal_fee, :limit => 8
      t.string :domestic_external_cash_withdrawal_fee_description
      t.integer :oversea_internal_cash_withdrawal_fee, :limit => 8
      t.string :oversea_internal_cash_withdrawal_fee_description
      t.integer :oversea_external_cash_withdrawal_fee, :limit => 8
      t.string :oversea_external_cash_withdrawal_fee_description
      t.float :currency_exchange_fee
      t.string :issuance_condition
      t.timestamps
    end
    add_index :products, :recommended
    add_index :products, :has_promotion
    add_index :products, :primary_card_annual_fee
    add_index :products, :sub_card_annual_fee
    add_index :products, :currency_exchange_fee
  end
end
