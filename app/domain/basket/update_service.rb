class Basket::UpdateService
  attr_accessor :basket, :product_id, :action_name

  def initialize(basket, product_id, action_name)
    @basket = basket
    @product_id = product_id
    @action_name = "#{action_name}_product".to_sym
  end

  def self.call(basket, product_id, action_name)
    new(basket, product_id, action_name).call
  end

  def call
    send(action_name)
  end

  private

  def add_product
    basket[:products]["#{product_id}"] ||= 0
    basket[:products]["#{product_id}"] += 1
  end

  def remove_product
    if basket[:products]["#{product_id}"] && basket[:products]["#{product_id}"] > 0
      basket[:products]["#{product_id}"] -= 1
    end
    basket[:products].delete("#{product_id}") if basket[:products]["#{product_id}"] == 0
  end
end