FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Name_#{n}" }
    sequence(:product_code) { |n| "C_#{n}" }
    price { (rand*100).to_i }

  end
end