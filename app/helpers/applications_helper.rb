# frozen_string_literal: true

module ApplicationsHelper
  def application_id
    Application.find(params[:id])
  end

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end
end
