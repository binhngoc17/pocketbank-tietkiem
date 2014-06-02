# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:email) { |i| "email#{i}@gmail.com" }
  factory :user do
    email
    password "12345678"
    role "user"
  end
end
