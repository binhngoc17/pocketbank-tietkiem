class Product < ActiveRecord::Base
  include Enumerize
  belongs_to :as_product, :polymorphic => true

  belongs_to :provider

  enumerize :card_rank, in: [:classic, :superior, :premium]

  validates :primary_card_annual_fee, :sub_card_annual_fee, :issuance_fee, 
    :domestic_internal_cash_withdrawal_fee, :domestic_external_cash_withdrawal_fee,
    :oversea_internal_cash_withdrawal_fee, :oversea_external_cash_withdrawal_fee,
    :currency_exchange_fee, :numericality => true, :allow_nil => true
end
