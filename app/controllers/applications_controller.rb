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
    new_application = Application.new(application_params)
    if new_application.save
     params[:favorite_ids].each do |favorite_id|
       PetApplication.create!({pet_id: favorite_id, application_id: new_application.id})
       session[:favorites].delete(favorite_id)
     end
      flash[:applied] = "Your application for the selected pets has been submitted."
      redirect_to "/favorites"
    else
      flash[:incomplete] = "You must complete all fields in order to submit the application."
      redirect_to '/applications/new'
    end
  end
end
