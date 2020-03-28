class Application < ApplicationRecord
  has_many :pets
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
