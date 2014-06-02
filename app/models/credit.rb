class Credit < ActiveRecord::Base
  extend Enumerize
  acts_as_product

  validates :name, :image, :link, :primary_card_annual_fee, :currency_exchange_fee, :presence => true

  validates :cash_back_rate, :finance_charge_per_year, :advance_fee_at_ATM,
    :interest_free_day, :expiry_period, :cash_advance_fee, :numericality => true, :allow_nil => true

  enumerize :brand, :in => [:visa, :master, :american_express, :jcb, :unionpay]

  def self.query(query)
    joins(:product).where("products.name ~~* ?", "%#{query}%")
  end
end
