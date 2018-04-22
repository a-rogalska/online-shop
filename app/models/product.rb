class Product < ApplicationRecord
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :product_code, :name, :price, presence: true
  validates :price, numericality: { greather_than_or_equal_to: 0.0 }

  scope :by_code, ->(code) { where(product_code: code) }
end
