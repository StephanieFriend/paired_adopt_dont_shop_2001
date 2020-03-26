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
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.find(params[:id])
    @pet = @shelter.pets.create!(pet_params)
    redirect_to "/shelters/#{@shelter.id}/pets"
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
   @pet = Pet.find(params[:id])
  end

  def update
   pet = Pet.find(params[:id])
   pet.update(pet_params)

   pet.save

   redirect_to "/pets/#{pet.id}"
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end

  def favorite
    pet = Pet.find(params[:id])
    if session[:favorites] == nil
      session[:favorites] = [params[:id]]
      flash[:favorited] = " #{pet.name} has been added to your favorites!"
    else
      if session[:favorites].include?(params[:id])
        session[:favorites].delete(params[:id])
        flash[:favorited] = " #{pet.name} has been removed from your favorites!"
      else
        session[:favorites] << params[:id]
        flash[:favorited] = "#{pet.name} has been added to your favorites!"
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
