# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    provider nil
    address "MyString"
    service_time "MyString"
    lng 1.5
    lat 1.5
    street_number "MyString"
    local_political "MyString"
    sublocality_political "MyString"
    route "MyString"
    country_political "MyString"
    administrative_area_level_1_political "MyString"
    administrative_area_level_2_political "MyString"
    name "MyString"
    type ""
  end
end
