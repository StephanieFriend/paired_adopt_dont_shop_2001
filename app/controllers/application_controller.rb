class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 private

  def dynamic_destroy(object, route)
    (object).destroy(params[:id])
    redirect_to route
  end

  def get_shelter_info
    Shelter.find(params[:id])
  end

  def get_pet_info
    Pet.find(params[:id])
  end

  def get_review_info
    Review.find(params[:id])
  end

  def pet_params
    params[:status] = "adoptable"
    params.permit(:image, :name, :description, :age, :sex, :status)
  end

  def review_params
    params.permit(:title, :rating, :content, :image)
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
