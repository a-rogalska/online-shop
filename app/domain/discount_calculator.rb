class DiscountCalculator
  attr_accessor :basket, :products, :code

  def initialize(basket, code)
    @basket = basket
    @code = code
    @products = Product.where(id: basket[:products].keys)
  end

  def bulk_discount
    product = products.by_code(code).take
    count = basket[:products][product.try(:id).to_s]
    return if count.nil? || count < 3
    basket[:total][:total_price] -= 4.50
    basket[:total][:discount] += 4.50
  end

  def one_to_one_discount
    product = products.by_code(code).take
    count = basket[:products][product.try(:id).to_s]
    return if count.nil? || count <= 1
    discount = (count / 2).to_i
    basket[:total][:total_price] -= product.price * discount
    basket[:total][:discount] += product.price * discount
  end
end