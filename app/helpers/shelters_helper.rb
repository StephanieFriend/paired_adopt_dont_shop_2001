# frozen_string_literal: true

module SheltersHelper
  def shelter_id
    Shelter.find(params[:id])
  end

  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
