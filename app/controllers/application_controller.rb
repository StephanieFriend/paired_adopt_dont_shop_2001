class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def favorites_universal
     cookies[:favorites] ||= []
     @favorited_pets_counter = cookies[:favorites].length
  end
end
