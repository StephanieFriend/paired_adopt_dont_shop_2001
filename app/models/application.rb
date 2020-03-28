class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications
  belongs_to :pet

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :state,
                        :zip,
                        :phone_number,
                        :description
end
