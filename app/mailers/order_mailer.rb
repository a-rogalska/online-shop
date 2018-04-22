class OrderMailer < ApplicationMailer
  def summary(order, pdf)
    @order = order
    attachments["order_#{order.id}_summary.pdf"] = pdf

    mail(to: order.email, subject: "Order ##{order.id} summary")
  end
end