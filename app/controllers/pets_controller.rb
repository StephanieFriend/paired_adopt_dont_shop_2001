class PetsController < ApplicationController

  def index
    all_pets = Pet.all
    if request.fullpath == '/favorites'
      if all_pets != nil && session[:favorites] != nil
        @pets = all_pets.find_all { |pet| session[:favorites].include?(pet.id.to_s)}
      else
        @pets = []
      end
    else
      @pets = all_pets
    end
  end

  def new
    @shelter = get_shelter_info
  end

  def create
    @shelter = get_shelter_info
    @pet = @shelter.pets.create!(pet_params)
    redirect_to "/shelters/#{@shelter.id}/pets"
  end

  def show
    @pet = get_pet_info
  end

  def edit
    @pet = get_pet_info
  end

  def update
    get_pet_info.update(pet_params)

    get_pet_info.save

    redirect_to "/pets/#{get_pet_info.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  def favorite
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

  private

  def pet_params
    params[:status] = "adoptable"
    params.permit(:image, :name, :description, :age, :sex, :status)
  end
end
