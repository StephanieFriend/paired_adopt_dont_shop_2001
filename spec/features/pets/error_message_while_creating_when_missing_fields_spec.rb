# require 'rails_helper'
#
# RSpec.describe "Creating Pet" do
#
#     it "I see a flash message if fields are incomplete" do
#
#       visit "/shelters/#{@shelter_1.id}/pets/new"
#
#       fill_in 'name', with: "Test"
#
#       click_on 'Submit'
#
#       expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")
#       expect(page).to have_content("You must complete all fields in order to submit a new pet.")
#     end
#   end
