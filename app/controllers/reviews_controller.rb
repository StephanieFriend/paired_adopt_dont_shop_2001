# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = shelter_info
  end

  def new
    @shelter = shelter_info
  end

  def create
    @shelter = shelter_info
    @review = @shelter.reviews.create(review_params)
    if @review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:notice] = 'All fields are required'
      redirect_to "/shelters/#{@shelter.id}/reviews"
    end
  end

  def edit
    @review = review_info
  end

  def update
    review = review_info
    review.update(review_params)
    if review.save
      redirect_to "/shelters/#{review.shelter.id}"
    else
      flash[:notice] = 'All fields are required'
      redirect_to "/reviews/#{review.id}/edit"
    end
  end

  def destroy
    review = review_info
    dynamic_destroy(Review, "/shelters/#{review.shelter.id}")
  end
end
