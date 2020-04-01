class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @shelter = get_shelter_info
  end

  def create
    @shelter = get_shelter_info
    @pet = @shelter.pets.create(pet_params)
    if @pet.save
      redirect_to "/shelters/#{@shelter.id}/pets"
    else
      flash[:error] =  @pet.errors.full_messages.to_sentence
      redirect_to "/shelters/#{@shelter.id}/pets/new"
    end
  end

  def show
    @pet = get_pet_info
    if @pet.pet_applications.find_by(approved: true) != nil
     @application_name = @pet.pet_applications.find_by(approved: true).application
    end
  end

  def edit
    @pet = get_pet_info
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    if pet.save
      redirect_to "/pets/#{pet.id}"
    else
      flash[:error] =  @pet.errors.full_messages.to_sentence
      redirect_to "/pets/#{pet.id}/edit"
    end
  end

  def destroy
    dynamic_destroy(Pet, '/pets')
    session[:favorites] = [params[:id]]
  end

  def favorites
    @applications = Application.all
    all_pets = Pet.all
    if all_pets != nil && session[:favorites] != nil
      @pets = all_pets.find_all { |pet| session[:favorites].include?(pet.id.to_s)}
    else
      @pets = []
    end
  end

  def toggle_favorite
    if session[:favorites] == nil
      session[:favorites] = [params[:id]]
      flash[:favorited] = "#{get_pet_info.name} has been added to your favorites!"
    else
      if session[:favorites].include?(params[:id])
        session[:favorites].delete(params[:id])
        flash[:favorited] = "#{get_pet_info.name} has been removed from your favorites!"
      else
        session[:favorites] << params[:id]
        flash[:favorited] = "#{get_pet_info.name} has been added to your favorites!"
      end
    end
    redirect_to "/pets/#{params[:id]}"
  end

  def delete_favorites
    session[:favorites] = []
    redirect_to '/favorites'
  end
end
