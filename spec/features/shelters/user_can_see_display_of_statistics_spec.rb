require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a shelters show page' do
    it 'I can see the count of pets' do

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_content("Pets at This Shelter(2)")
    end
    it 'I can see the count of reviews' do

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_content("Reviews(2)")
    end
    it 'I can see the average shelter review rating' do

      visit "/shelters/#{@shelter_1.id}"

      expect(page).to have_content("Review Average: 3.5")
    end
  end
end


# As a visitor
# When I visit a shelter's show page
# I see statistics for that shelter, including:
# - count of pets that are at that shelter
# - average shelter review rating
# - number of applications on file for that shelter