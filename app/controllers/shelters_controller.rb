class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new; end

  def create
    new_shelter = Shelter.create(shelter_params)
    if new_shelter.save
      flash[:success] = "Your Shelter has been added!"
      redirect_to '/shelters'
    else
      flash[:error] = new_shelter.errors.full_messages.to_sentence
      redirect_to '/shelters/new'
    end
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
      pet.pet_applications.find_all do |petapp|
        if petapp.approved
          flash[:notice] = "Cannot Delete Shelter. Pets With Pending Applications."
          redirect_to "/shelters/#{shelter.id}" and return
        end
      end
    end
    dynamic_destroy(Shelter, "/shelters")
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.reviews.all
  end

  def pets
    @shelter = get_shelter_info
    @pets = @shelter.pets.all
  end
end
