json.array! @debits do |debit|
  json.(debit, :id, :name, :domestic_external_cash_withdrawal_fee, :primary_card_annual_fee, :withdrawal_limit, :domestic_internal_cash_withdrawal_fee, :currency_exchange_fee)
end
