# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :debit do
    internal_transaction_fee 1
    internal_transaction_fee_description "MyString"
    external_transaction_fee 1
    external_transaction_fee_description "MyString"
    daily_withdrawal_limit 1
    withdrawal_limit 1
    daily_expense_limit 1
    expense_limit 1
    daily_transaction_limit 1
    transaction_limit 1
  end
end
