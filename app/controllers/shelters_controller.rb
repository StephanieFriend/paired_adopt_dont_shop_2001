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
    shelter = get_shelter_info
    shelter.pets.each do |pet|
      pet.pet_applications.each do |petapp|
        if !petapp.approved
          dynamic_destroy(Shelter, "/shelters")
        else
          flash[:notice] = "Cannot Delete Shelter. Pets With Pending Applications."
          redirect_to "/shelters/#{shelter.id}"
        end
      end
    end

  end

  def show
    @shelter = get_shelter_info
    @reviews = @shelter.reviews.all
  end

  def pets
    @shelter = get_shelter_info
    @pets = @shelter.pets.all
  end
end
