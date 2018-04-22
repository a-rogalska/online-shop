class Basket::Calculations
  attr_accessor :basket

  def initialize(basket)
    @basket = basket
  end

  def self.call(basket)
    new(basket).call
  end

  def call
    @basket[:total] = Basket::Total.new(products_count, total_price)
  end

  private

  def products_count
    basket[:products].values.reduce(:+) || 0
  end

  def total_price
    ids = basket[:products].keys
    return 0 if ids.empty?
    products = Product.where(id: ids)
    products.map do |product|
      product.price * basket[:products]["#{product.id}"]
    end.reduce(:+)
  end
end