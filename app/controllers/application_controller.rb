# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def dynamic_destroy(object, route)
    object.destroy(params[:id])
    redirect_to route
  end

  def shelter_info
    Shelter.find(params[:id])
  end

  def pet_info
    Pet.find(params[:id])
  end

  def review_info
    Review.find(params[:id])
  end

  def application_info
    Application.find(params[:id])
  end

  def pet_params
    params[:status] = 'adoptable'
    params.permit(:image, :name, :description, :age, :sex, :status)
  end

  def review_params
    params.delete(:image) if params[:image].empty?
    params.permit(:title, :rating, :content, :image)
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
