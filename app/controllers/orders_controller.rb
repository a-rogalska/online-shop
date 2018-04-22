class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :summary]

  def show
    @order = Order.find(params[:id])
  end

  def new
    if @basket[:products].empty?
      redirect_to products_url, notice: "You don't have products in basket."
    else
      @order = Order.new
      @total = @basket[:total].with_indifferent_access
    end
  end

  def create
    @order = Order.new(order_params)
    @order.total = @basket[:total]["total_price"]
    @order.discount = @basket[:total]["discount"]
    if @order.save
      ProductsOrderService.call(@basket, @order)
      reset_session
      redirect_to @order, notice: "Your order has been created."
    else
      errors = @order.errors.full_messages.map { |m| m }.join(', ')
      redirect_to new_order_path, flash: { error: errors }
    end
  end

  def summary
    SendOrderSummaryWorker.perform_async(@order.id)
    head :no_content
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :address, :total, :discount)
  end
end
