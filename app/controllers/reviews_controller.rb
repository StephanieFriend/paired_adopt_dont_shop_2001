class ReviewsController < ApplicationController
  def index
    @reviews = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @review = @shelter.reviews.create(review_params)
    redirect_to "/shelters/#{@shelter.id}"
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  private

  def review_params
    params.permit(:title, :rating, :content, :image)
  end
end
