require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.new(:name => "test")
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create(:name => 'test', :price => 500, :quantity => 1, :category => @category)
      @product2 = Product.create(:name => 'anotherTest', :price => 200, :quantity => 15, :category => @category)
      @product1.save
      @product2.save
      
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create(:name => 'out', :price => 5500, :quantity => 3, :category => @category)
      @product3.save
      @test_cart = [@product1, @product2]
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.create(:email => "testemail@test.com", :total_cents => 70000, :stripe_charge_id => 1)
      # 2. build line items on @order
      # ...

      @test_cart.each do |entry|
        product = Product.find(entry.id)
        product.quantity -= 1
        product.save
        product = entry[:product]
        quantity = entry[:quantity]
        price = entry[:price_cents]/100.00
        @order.line_items.new(
          product: product,
          quantity: quantity,
          item_price: price,
          total_price: price * quantity
        )
      end

      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1 = Product.find(@product1.id)
      @product2 = Product.find(@product2.id)
      
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(0)
      expect(@product2.quantity).to eq(14)

    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      product3 = Product.find(@product3.id)
      expect(product3.quantity).to eq(3)
    end
  end
end