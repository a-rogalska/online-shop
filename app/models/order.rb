class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders

  validates :first_name, :last_name, :email, :address, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
