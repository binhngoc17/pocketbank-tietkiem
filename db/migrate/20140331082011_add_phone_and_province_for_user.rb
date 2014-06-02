class AddPhoneAndProvinceForUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :phone
      t.references :province
    end
  end
end
