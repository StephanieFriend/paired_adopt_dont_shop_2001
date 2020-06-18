# frozen_string_literal: true

module PetsHelper
  def pet_id
    Pet.find(params[:id])
  end

  def pet_params
    params[:status] = 'adoptable'
    params.permit(:image, :name, :description, :age, :sex, :status)
  end
end
