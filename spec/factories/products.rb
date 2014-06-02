# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    provider nil
    image "MyString"
    link "MyString"
    name "MyString"
    recommended false
    has_promotion false
    description "MyText"
    primary_card_annual_fee ""
    sub_card_annual_fee ""
    issuance_fee ""
    domestic_internal_cash_withdrawal_fee ""
    domestic_internal_cash_withdrawal_fee_description "MyString"
    domestic_external_cash_withdrawal_fee ""
    domestic_external_cash_withdrawal_fee_description "MyString"
    oversea_internal_cash_withdrawal_fee ""
    oversea_internal_cash_withdrawal_fee_description "MyString"
    oversea_external_cash_withdrawal_fee ""
    oversea_external_cash_withdrawal_fee_description "MyString"
    currency_exchange_fee 1.5
    issuance_condition "MyString"
  end
end
