class CreateDebits < ActiveRecord::Migration
  def change
    create_table :debits do |t|
      t.integer :internal_transaction_fee
      t.string :internal_transaction_fee_description
      t.integer :external_transaction_fee
      t.string :external_transaction_fee_description
      t.integer :daily_withdrawal_limit, :limit => 8
      t.integer :withdrawal_limit, :limit => 8
      t.integer :daily_expense_limit, :limit => 8
      t.integer :expense_limit, :limit => 8
      t.integer :daily_transaction_limit, :limit => 8
      t.integer :transaction_limit, :limit => 8

      t.timestamps
    end
    add_index :debits, :withdrawal_limit
  end
end
