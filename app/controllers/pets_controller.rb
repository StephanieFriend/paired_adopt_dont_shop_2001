# frozen_string_literal: true

class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @shelter = shelter_id
  end

  def create
    @shelter = shelter_id
    @pet = @shelter.pets.create(pet_params)
    if @pet.save
      redirect_to "/shelters/#{@shelter.id}/pets"
    else
      flash[:error] = error_msg(@pet)
      redirect_to "/shelters/#{@shelter.id}/pets/new"
    end
  end

  def show
    @pet = pet_id
    @application_name = @pet.pet_applications.find_by(approved: true).application if !@pet.pet_applications.find_by(approved: true).nil?
  end

  def edit
    @pet = pet_id
  end

  def update
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    if pet.save
      redirect_to "/pets/#{pet.id}"
    else
      flash[:error] = error_msg(pet)
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
    @pets = if !all_pets.nil? && !session[:favorites].nil?
              all_pets.find_all { |pet| session[:favorites].include?(pet.id.to_s) }
            else
              []
            end
  end

  def toggle_favorite
    if session[:favorites].nil?
      session[:favorites] = [params[:id]]
      flash[:favorited] = "#{pet_id.name} has been added to your favorites!"
    else
      if session[:favorites].include?(params[:id])
        session[:favorites].delete(params[:id])
        flash[:favorited] = "#{pet_id.name} has been removed from your favorites!"
      else
        session[:favorites] << params[:id]
        flash[:favorited] = "#{pet_id.name} has been added to your favorites!"
      end
    end
    redirect_to "/pets/#{params[:id]}"
  end

  def delete_favorites
    session[:favorites] = []
    redirect_to '/favorites'
  end
end
