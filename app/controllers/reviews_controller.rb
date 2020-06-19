# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = shelter_id
  end

  def new
    @shelter = shelter_id
  end

  def create
    @shelter = shelter_id
    @review = @shelter.reviews.create(review_params)
    if @review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:error] = error_msg(@review)
      redirect_to "/shelters/#{@shelter.id}/reviews"
    end
  end

  def edit
    @review = review_id
  end

  def update
    review = review_id
    review.update(review_params)
    if review.save
      redirect_to "/shelters/#{review.shelter.id}"
    else
      flash[:notice] = 'All fields are required'
      redirect_to "/reviews/#{review.id}/edit"
    end
  end

  def destroy
    review = review_id
    dynamic_destroy(Review, "/shelters/#{review.shelter.id}")
  end
end
