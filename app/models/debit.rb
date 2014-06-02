class Debit < ActiveRecord::Base
  extend Enumerize
  acts_as_product

  validates :name, :image, :link, :primary_card_annual_fee, :domestic_internal_cash_withdrawal_fee, :withdrawal_limit, :presence => true

  validates :internal_transaction_fee, :external_transaction_fee, :daily_withdrawal_limit, 
    :withdrawal_limit, :daily_expense_limit, :expense_limit, :daily_transaction_limit, :transaction_limit, 
    :numericality => true, :allow_nil => true

  enumerize :brand, :in => [:visa, :master, :american_express, :unionpay]

  def self.query(query)
    joins(:product).where("products.name ~~* ?", "%#{query}%")
  end
end
