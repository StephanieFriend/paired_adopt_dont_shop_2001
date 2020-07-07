# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include PetsHelper
  include ApplicationsHelper
  include ReviewsHelper
  include SheltersHelper

  private

  def error_msg(object)
    object.errors.full_messages.to_sentence
  end

  def dynamic_destroy(object, route)
    object.destroy(params[:id])
    redirect_to route
  end
end
