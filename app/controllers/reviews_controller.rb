class ReviewsController < ApplicationController
  def index
    @reviews = get_shelter_info
  end

  def new
    @shelter = get_shelter_info
  end

  def create
    @shelter = get_shelter_info
    @review = @shelter.reviews.create(review_params)
    if @review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:notice] = "All fields are required"
      redirect_to "/shelters/#{@shelter.id}/reviews"
    end
  end

  def edit
    @review = get_review_info
  end

  def update
    review = get_review_info
    review.update(review_params)
    if review.save
      redirect_to "/shelters/#{review.shelter.id}"
    else
      flash[:notice] = "All fields are required"
      redirect_to "/reviews/#{review.id}/edit"
    end
  end

  def destroy
    review = get_review_info
    Review.destroy(params[:id])

    redirect_to "/shelters/#{review.shelter.id}"
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :image)
  end
end
