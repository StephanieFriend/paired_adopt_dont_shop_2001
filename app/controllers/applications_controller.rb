class ApplicationsController < ApplicationController

  def index
    @pet = get_pet_info
  end

  def show
    @application = get_application_info
    @petapps = @application.pet_applications.all
  end

  def approve_status
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    if pet.status == "pending"
      flash[:notice] = "Not Taking New Applications At This Time"
      redirect_to "/applications/#{application.id}"
    else
      pet.update_attribute(:status, "pending")
      pet_application = PetApplication.where(application_id: params[:application_id], pet_id: params[:pet_id]).first
      pet_application.update(approved: true)

      redirect_to "/pets/#{pet.id}"
    end
  end

  def revoke_status
    application = Application.find(params[:application_id])
    pet = Pet.find(params[:pet_id])
    pet.update_attribute(:status, "adoptable")
    pet_application = PetApplication.where(application_id: params[:application_id], pet_id: params[:pet_id]).first
    pet_application.update(approved: false)

    redirect_to "/applications/#{application.id}"
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

  def pet_application
    @pet = get_pet_info
  end
end
