class OrderMailer < ApplicationMailer
  default from: "noreply@jungle.com"
  layout 'mailer'

  def send_email(order)
    @email = order.email
    @items = ''
    order.line_items.each do |item|
      @product = Product.find(item.product_id)
      @items += " |  Name: " + @product.name.to_s + ", Qty: " + item.quantity.to_s + ", Price: " + @product.price.to_s + " | "
    end
    @items += "Total: " + (order.total_cents / 100.00).to_s
    
    mail(to: @email, from: 'noreply@jungle.com', subject: 'Order ID: ' + order.id.to_s, body: @items)
  end  

end
