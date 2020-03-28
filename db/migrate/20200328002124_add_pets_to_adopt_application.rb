class AddPetsToAdoptApplication < ActiveRecord::Migration[5.1]
  def change
    add_reference :pets, :adopt_application, foreign_key: true
  end
end
