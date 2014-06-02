class ChangeImageAndLinkToText < ActiveRecord::Migration
  def up
    change_column :products, :link, :text
    change_column :products, :image, :text
  end
  def down
    change_column :products, :link, :string
    change_column :products, :image, :string
  end
end
