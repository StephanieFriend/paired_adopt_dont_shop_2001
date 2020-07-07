# frozen_string_literal: true

class SheltersController < ApplicationController
  def index
    @shelters = Shelter.all
  end

  def new; end

  def create
    new_shelter = Shelter.create(shelter_params)
    if new_shelter.save
      flash[:created] = 'Your Shelter has been added!'
      redirect_to '/shelters'
    else
      flash[:error] = error_msg(new_shelter)
      redirect_to '/shelters/new'
    end
  end

  def edit
    @shelter = shelter_id
  end

  def update
    updated_shelter = Shelter.update(params[:id], shelter_params)
    if updated_shelter.save
      flash[:updated] = 'Your Shelter has been updated!'
      redirect_to "/shelters/#{updated_shelter.id}"
    else
      flash[:error] = error_msg(updated_shelter)
      redirect_to "/shelters/#{updated_shelter.id}/edit"
    end
  end

  def destroy
    shelter = shelter_id
    shelter.pets.each do |pet|
      pet.pet_applications.find_all do |petapp|
        if petapp.approved
          flash[:notice] = 'Cannot Delete A Shelter With Pending Applications.'
          redirect_to "/shelters/#{shelter.id}" and return
        end
      end
    end
    dynamic_destroy(Shelter, '/shelters')
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.reviews.all
  end

  def pets
    @shelter = shelter_id
    @pets = @shelter.pets.all
  end
end
