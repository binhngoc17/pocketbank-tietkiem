class AddCbrdescToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :cash_back_rate_description, :string
  end
end
