class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.string :reward_point
      t.boolean :reward_card
      t.float :cash_back_rate
      t.float :finance_charge_per_year
      t.float :advance_fee_at_ATM
      t.integer :interest_free_day
      t.string :credit_limit
      t.integer :expiry_period
      t.string :late_charge
      t.float :cash_advance_fee

      t.timestamps
    end

    add_index :credits, :cash_back_rate
  end
end
