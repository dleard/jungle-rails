require 'rails_helper'



describe Product, type: :model do
  describe 'Validations' do
    it 'should save if all validations pass (first_name, last_name, email, password, password_confirmation presence = true && email uniqueness = true' do
      pre_save_count = User.count
      @user = User.new(:first_name => 'test', :last_name => 'test', :email => 'test@test.com', :password => 'password', 
      :password_confirmation => 'password')
      @user.save
      expect(User.count).not_to eq(pre_save_count)
    end
    
    it 'should not save if first_name is missing' do
      pre_save_count = User.count
      @user = User.new(:first_name => nil, :last_name => 'test', :email => 'test@test.com', :password => 'password', 
      :password_confirmation => 'password')
      @user.save
      expect(User.count).to eq(pre_save_count)
    end

    it 'should not save if last_name is missing' do
      pre_save_count = User.count
      @user = User.new(:first_name => 'test', :last_name => nil, :email => 'test@test.com', :password => 'password', 
      :password_confirmation => 'password')
      @user.save
      expect(User.count).to eq(pre_save_count)
    end

    it 'should not save if email is missing' do
      pre_save_count = User.count
      @user = User.new(:first_name => 'test', :last_name => 'test', :email => nil, :password => 'password', 
      :password_confirmation => 'password')
      @user.save
      expect(User.count).to eq(pre_save_count)
    end

    it 'should not save if password is missing' do
      pre_save_count = User.count
      @user = User.new(:first_name => 'test', :last_name => 'test', :email => 'test@test.com', :password => nil, 
      :password_confirmation => 'password')
      @user.save
      expect(User.count).to eq(pre_save_count)
    end

    it 'should not save if password_confirmation is missing' do
      pre_save_count = User.count
      @user = User.new(:first_name => 'test', :last_name => 'test', :email => 'test@test.com', :password => 'password', 
      :password_confirmation => nil)
      @user.save
      expect(User.count).to eq(pre_save_count)
    end

    it 'should not save if email already exists in the db' do
      @before_user = User.new(:first_name => 'test1', :last_name => 'test1', :email => 'ultron@ultron.com', :password => 'password', 
      :password_confirmation => 'password') 
      @before_user.save
      pre_save_count = User.count

      @user = User.new(:first_name => 'test', :last_name => 'test', :email => 'ultron@ultron.com', :password => 'password', 
      :password_confirmation => 'password')
      @user.save

      expect(User.count).to eq(pre_save_count)
    end

  end

# RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
