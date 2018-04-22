class Export::OrderSummaryPdf < Prawn::Document
  attr_accessor :order, :template

  def initialize(order)
    super()
    @order = order
    @template = ActionView::Base.new
    create_template
  end

  def create_template
    order_details
    products_table
    summary
  end

  private

  def order_details
    text "Order ##{order.id}", size: 16, style: :bold, align: :center

    bounding_box([0, cursor], width: 300) do
      text "<b>Client:</b> #{order.first_name} #{order.last_name}", inline_format: true
      text "<b>Address:</b> #{order.address}", inline_format: true
      text "<b>Email:</b> #{order.email}", inline_format: true
    end
    move_down 15
  end

  def products_table
    text "Products", size: 14, style: :bold, align: :center

    data = [["Name", "Count", "Price (for 1)", "Price"]]
    @order.product_orders.each do |product_order|
      data << [product_order.product.name, product_order.count,
              template.number_to_currency(product_order.product.price),
              template.number_to_currency(product_order.product.price * product_order.count)]
    end

    table(data) do |table|
      table.column_widths = [100, 100, 100, 100]
      table.cell_style = { padding: 5, size: 12, align: :center }
      table.row(0).font_style = :bold
      table.position = :center
    end
    move_down 15
  end

  def summary
    total = template.number_to_currency(@order.total)
    discount = template.number_to_currency(@order.discount)
    text "Discount: #{discount}", size: 16, style: :bold
    text "Total price: #{total}", size: 16, style: :bold
  end
end