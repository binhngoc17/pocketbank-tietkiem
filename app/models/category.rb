class Category < ActiveRecord::Base
  validates :name, :presence => true


  def self.query(query)
    where("name LIKE ?", "%#{query}%")
  end
end
