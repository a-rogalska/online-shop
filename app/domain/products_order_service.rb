class ProductsOrderService
  attr_accessor :basket, :order

  def initialize(basket, order)
    @basket = basket
    @order = order
  end

  def self.call(basket, order)
    new(basket, order).call
  end

  def call
    create_product_orders
  end

  private

  def create_product_orders
    products = Product.where(id: @basket[:products].keys)
    products.each do |product|
      ProductOrder.create(product: product, order: @order, count: @basket[:products]["#{product.id}"])
    end
  end
end