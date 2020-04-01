require 'rails_helper'

  RSpec.describe "pet name is link or button" do

    it "pets index page takes me to that pets show page" do

      visit '/pets'

      click_link("#{@pet_1.name}")

      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end

    it "shelter pets index takes me to that pets show page" do

      visit "/shelters/#{@shelter_1.id}/pets"

      click_link("#{@pet_1.name}")

      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end

    it "application form takes me to that pet's show page" do

      visit "/pets/#{@pet_1.id}"

      click_on "Favorite This Pet"

      visit "/applications/new"

      click_link("#{@pet_1.name}")

      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end

    it "favorites page takes me to that pet's show page" do

      visit "/pets/#{@pet_1.id}"
      click_on "Favorite This Pet"

      visit "/favorites"

      click_link("#{@pet_1.name}")

      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end
  end
