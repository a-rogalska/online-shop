FactoryBot.define do
  factory :product_order do
    association :order
    association :product
    count 1

  end
end