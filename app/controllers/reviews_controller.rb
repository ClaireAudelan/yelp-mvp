class ReviewsController < ApplicationController
  before_action :get_restaurant
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
