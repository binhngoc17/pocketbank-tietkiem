class AddCardRankToProducts < ActiveRecord::Migration
  def change
    add_column :products, :card_rank, :string
  end
end
