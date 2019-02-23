class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    @review.product_id = params[:product_id]
    @review.save
    redirect_to request.referrer 
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
