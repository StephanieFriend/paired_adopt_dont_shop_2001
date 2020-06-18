# frozen_string_literal: true

class Application < ApplicationRecord
  has_many :pet_applications, dependent: :destroy
  has_many :pets, through: :pet_applications

  validates :name,
            :address,
            :city,
            :state,
            :state,
            :zip,
            :phone_number,
            :description, presence: true
end
