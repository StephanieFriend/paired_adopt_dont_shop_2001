class ApplicationsController < ApplicationController

  def index
    @pet = get_pet_info
  end

  def new
    all_pets = Pet.all
    if all_pets != nil && session[:favorites] != nil
      @favorited_pets = all_pets.find_all { |pet| session[:favorites].include?(pet.id.to_s)}
    else
      @favorited_pets = []
    end
  end

  def create
    Application.create(application_params)
    redirect_to "/favorites"
  end




end
