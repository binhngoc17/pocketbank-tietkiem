class Provider < ActiveRecord::Base
  validates :name, :image, :link, :presence => true


  def self.query(query)
    where("name ~~* ?", "%#{query}%")
  end
end
