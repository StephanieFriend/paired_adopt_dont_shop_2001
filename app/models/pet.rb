class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications, dependent: :destroy
  has_many :applications, through: :pet_applications

  validates_presence_of :image,
                        :name,
                        :age,
                        :sex,
                        :description,
                        :status

  def change_adoptable_status
    status ? "adoptable" : "pending"
  end

  def owner
   # pet_applications.where(approved: true).first.applications
  end
end
