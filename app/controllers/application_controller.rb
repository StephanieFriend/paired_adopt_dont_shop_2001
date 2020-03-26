class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 private

  def get_shelter_info
    Shelter.find(params[:id])
  end

  def get_pet_info
    Pet.find(params[:id])
  end

  def get_review_info
    Review.find(params[:id])
  end
end
