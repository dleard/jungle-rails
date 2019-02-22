class OrderMailer < ApplicationMailer
  default from: "noreply@jungle.com"
  layout 'mailer'

  def send_email(user, products)
    @user = user
    @products = products
    mail(to: 'dleard@uvic.ca', from: 'noreply@jungle.com', subject: 'test', body: 'test')
  end  

end
