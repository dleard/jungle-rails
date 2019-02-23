class ReviewsController < ApplicationController
  
  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    @review.product_id = params[:product_id]
    if @review.save
      redirect_to '/'
    else
      redirect_to '/products/:product_id'
    end  
  end

  private
  def review_params
    params.require(:review).permit(
      :product_id,
      :user_id,
      :description,
      :rating
    )
  end
end
