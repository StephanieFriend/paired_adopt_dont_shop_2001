class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new; end

  def create
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

 def edit
   @shelter = Shelter.find(params[:id])
 end

 def update
    updated_shelter = Shelter.update(params[:id], shelter_params)
    redirect_to "/shelters/#{updated_shelter.id}"
 end

 def destroy
   Shelter.destroy(params[:id])

   redirect_to "/shelters"
 end

 def show
   @shelter = Shelter.find(params[:id])
 end

 def pets
   @shelter = Shelter.find(params[:id])
   @pets = @shelter.pets.all
 end

private

 def shelter_params
   params.permit(:name, :address, :city, :state, :zip)
 end

end
