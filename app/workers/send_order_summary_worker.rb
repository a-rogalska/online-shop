class SendOrderSummaryWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(order_id)
    order = Order.find(order_id)
    pdf = Export::OrderSummaryPdf.new(order)

    OrderMailer.summary(order, pdf.render).deliver_now
  end
end
