# frozen_string_literal: true

class AddStatusToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :status, :string
  end
end
