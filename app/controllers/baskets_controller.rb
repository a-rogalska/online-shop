class BasketsController < ApplicationController
  def update_product
    Basket::UpdateService.call(@basket, params[:product_id], params[:direction])
    render json: @basket, status: :ok
  end

  def total
    Basket::Calculations.call(@basket)
    DiscountCalculator.new(@basket, "AP1").bulk_discount
    DiscountCalculator.new(@basket, "FR1").one_to_one_discount
    render json: @basket, status: :ok
  end

  def products
    @products = Product.where(id: @basket[:products].keys)
    render json: @products, each_serializer: ProductSerializer, basket: @basket
  end
end
