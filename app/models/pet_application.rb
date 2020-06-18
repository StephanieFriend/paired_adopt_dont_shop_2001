# frozen_string_literal: true

class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application
end
