class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.find(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
