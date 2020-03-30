class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  def change_approval_status
    @approved = !@approved
  end
end