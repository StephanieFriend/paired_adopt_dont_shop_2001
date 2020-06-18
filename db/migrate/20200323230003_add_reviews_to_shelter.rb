# frozen_string_literal: true

class AddReviewsToShelter < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :shelter, foreign_key: true
  end
end
