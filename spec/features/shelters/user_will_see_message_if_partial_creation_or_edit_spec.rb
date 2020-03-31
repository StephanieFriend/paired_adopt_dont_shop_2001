require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I update or create a new shelter' do
    it 'If I submit without all the info to create I get a flash message stating what info I am missing' do

      visit "/shelters"

      click_link "Create New Shelter"

      fill_in :name, with: "Test Shelter"
      fill_in :address, with: "123 Main Street"
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: ""

      click_button "Submit"

      expect(page).to have_content("Zip can't be blank")
    end

    it 'If I submit without several pieces of info to create I get a flash message stating all the missing fields' do

      visit "/shelters"

      click_link "Create New Shelter"

      fill_in "name", with: "Test Shelter"
      fill_in "address", with: "123 Main Street"
      fill_in "state", with: "CO"

      click_button "Submit"

      expect(page).to have_content("City can't be blank and Zip can't be blank")
    end
    it 'If I submit with all pieces of information to create I get a flash message stating your shelter has been added sucessfully' do

      visit "/shelters"

      click_link "Create New Shelter"

      fill_in "name", with: "Test Shelter"
      fill_in "address", with: "123 Main Street"
      fill_in "city", with: "Denver"
      fill_in "state", with: "CO"
      fill_in "zip", with: "80205"

      click_button("Submit")

      expect(page).to have_content("Your Shelter has been added!")
    end

    # EDIT
    it 'If I submit partial info to edit a shelter I get a flash message stating what info is missing' do

      visit "/shelters/#{@shelter_1.id}"

      click_link 'Edit Shelter'

      fill_in "name", with: ""

      click_button 'Submit'

      expect(page).to have_content("Name can't be blank")
    end
    it 'If I submit all fields of info to edit I get a confirmation flash message' do

      visit "/shelters/#{@shelter_1.id}"

      click_link 'Edit Shelter'

      fill_in "name", with: "Testing Update"

      click_button 'Submit'

      expect(page).to have_content("Your Shelter has been updated!")
    end
  end
end