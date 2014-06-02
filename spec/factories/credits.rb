# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit do
    reward_point "MyString"
    reward_card false
    cash_back_rate 1.5
    finance_charge_per_year 1.5
    advance_fee_at_ATM 1.5
    interest_free_day 1
    credit_limit "MyString"
    expiry_period 1
    late_charge "MyString"
    cash_advance_fee 1.5
  end
end
