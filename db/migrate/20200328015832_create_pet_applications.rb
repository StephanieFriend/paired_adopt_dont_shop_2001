# frozen_string_literal: true

class CreatePetApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_applications do |t|
      t.references :pet, foreign_key: true
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
