class OrderMailer < ApplicationMailer
  default from: "noreply@jungle.com"
  layout 'mailer'

  def send_email(order)
    @order = order
    @email = order.email
    mail(to: @email, from: 'noreply@jungle.com', subject: 'Order ID: ' + order.id.to_s)
  end  

end
