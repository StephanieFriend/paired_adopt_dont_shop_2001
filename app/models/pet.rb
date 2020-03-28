class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :applications

  validates_presence_of :image, :name, :age, :sex, :description, :status
end
