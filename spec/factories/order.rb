FactoryBot.define do
  factory :order do
    sequence(:first_name) { |n| "first_name_#{n}" }
    sequence(:last_name) { |n| "last_name_#{n}" }
    address "City, NY"
    email "email@test.com"

  end
end