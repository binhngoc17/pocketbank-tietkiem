require 'product_inherit'
class ActiveRecord::Base
  def self.acts_as_product
    include ProductInherit
  end
end
