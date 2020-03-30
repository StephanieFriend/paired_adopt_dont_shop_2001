require 'rails_helper'

RSpec.describe 'Able to favorite pet', type: :feature do
    it 'able to favorite pet on pets show page and favorite counter increases' do

      visit "/pets/#{@pet_1.id}"


      click_on('Favorite This Pet')

      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_content("#{@pet_1.name} has been added to your favorites!")


      visit "/pets/#{@pet_2.id}"

      expect(page).not_to have_content("This pet has been added to your favorites!")


      click_on('Favorite This Pet')

      expect(current_path).to eq("/pets/#{@pet_2.id}")
      expect(page).to have_content("#{@pet_2.name} has been added to your favorites!")
      
    end
  end
