class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: @product.id)
    @reviews_with_user = []
    @reviews.each do |review|
      user = User.find(review.user_id)
      review = {"user_id": review.user_id, "product_id": review.product_id, "description": review.description, "rating": review.rating, "created_at": review.created_at, "updated_at": review.updated_at, "user" => user.email}
      @reviews_with_user.push(review)
      puts review.inspect
    end  
  end

end
