require 'rails_helper'



describe Product, type: :model do
  describe 'Validations' do
    it 'should save if all four validations (name, price, quantity, category are present' do
      @category = Category.new(:name => "test")
      pre_save_count = Product.count
      @product = Product.new(:name => 'test', :price => 500, :quantity => 1, :category => @category)
      @product.save
      expect(Product.count).not_to eq(pre_save_count)
    end

    it 'should fail validations and not save if name is not present' do
      @category = Category.new(:name => "test")
      pre_save_count = Product.count
      @product = Product.new(:name => nil, :price => 500, :quantity => 1, :category => @category)
      @product.save
      expect(Product.count).to eq(pre_save_count)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should fail validations and not save if price is not present' do
      @category = Category.new(:name => "test")
      pre_save_count = Product.count
      @product = Product.new(:name => 'test', :price => nil, :quantity => 1, :category => @category)
      @product.save
      expect(Product.count).to eq(pre_save_count)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should fail validations and not save if quantity is not present' do
      @category = Category.new(:name => "test")
      pre_save_count = Product.count
      @product = Product.new(:name => 'test', :price => 500, :quantity => nil, :category => @category)
      @product.save
      expect(Product.count).to eq(pre_save_count)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should fail validations and not save if category is not present' do
      @category = Category.new(:name => "test")
      pre_save_count = Product.count
      @product = Product.new(:name => 'test', :price => 500, :quantity => 1, :category => nil)
      @product.save
      expect(Product.count).to eq(pre_save_count)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    
  end

# RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
