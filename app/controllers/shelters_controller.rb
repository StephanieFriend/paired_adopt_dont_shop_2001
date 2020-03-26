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
   @shelter = get_shelter_info
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
   @shelter = get_shelter_info
   @reviews = @shelter.reviews.all
 end

 def pets
   @shelter = get_shelter_info
   @pets = @shelter.pets.all
 end

private

 def shelter_params
   params.permit(:name, :address, :city, :state, :zip)
 end
end
