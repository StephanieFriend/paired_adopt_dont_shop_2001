class AddApplicationsToPets < ActiveRecord::Migration[5.1]
  def change
    add_reference :adopt_applications, :pet, foreign_key: true
  end
end
