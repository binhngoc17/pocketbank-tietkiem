require 'spec_helper'

describe Credit do
  it "Create without require parameters" do
    Credit.create!({
      name: 'TestCreditCard',
      image: 'img_url',
      link: 'link_url',
      primary_card_annual_fee: 2,
      currency_exchange_fee: 1,
      cash_back_rate: 3,
      finance_charge_per_year: 4,
      advance_fee_at_ATM: 1,
      interest_free_day: 5,
      expiry_period: 3, # Denoted in months
      cash_advance_fee: 4
                   }
    )
    card = Credit.find(1)
    card.image.to_s.should eql 'img_url'
    card.link.to_s.should eql 'link_url'
    card.primary_card_annual_fee.to_f.should eql 2.0
    card.currency_exchange_fee.to_f.should eql 1.0
    card.cash_back_rate.to_f.should eql 3.0
    card.finance_charge_per_year.to_f.should eql 4.0
    card.advance_fee_at_ATM.to_f.should eql 1.0
  end

  it "Test Using factory girl" do
    credit = FactoryGirl.create(:credit)
    credit.reward_point.to_s.should eql "MyString"
  end
end
