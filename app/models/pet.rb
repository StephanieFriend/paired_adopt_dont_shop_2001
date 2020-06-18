# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications, dependent: :destroy
  has_many :applications, through: :pet_applications

  validates :image,
            :name,
            :age,
            :sex,
            :description,
            :status, presence: true
end
