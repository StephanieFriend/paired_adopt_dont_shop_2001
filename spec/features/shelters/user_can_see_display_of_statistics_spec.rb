# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a shelters show page' do
    it 'I can see the count of pets' do
      visit "/shelters/#{@shelter1.id}"

      expect(page).to have_content('Pets at This Shelter(2)')
    end
    it 'I can see the count of reviews' do
      visit "/shelters/#{@shelter1.id}"

      expect(page).to have_content('Reviews(2)')
    end
    it 'I can see the average shelter review rating' do
      visit "/shelters/#{@shelter1.id}"

      expect(page).to have_content('Review Average: 3.5')
    end
    it 'I can see the number of current applications' do
      @application1 = Application.create(name: 'Mary Margret',
                                          address: '123 Charming Ln.',
                                          city: 'Storybrooke',
                                          state: 'ME',
                                          zip: '54321',
                                          phone_number: '123-456-7890',
                                          description: "I'm Snow White. Duh.")

      @application2 = Application.create(name: 'Dr. Hopper',
                                          address: '241 Cricket Dr.',
                                          city: 'Storybrooke',
                                          state: 'ME',
                                          zip: '54321',
                                          phone_number: '098-765-4321',
                                          description: 'This Cricket would like a friend to play with!')

      PetApplication.create({ pet_id: @pet1.id, application_id: @application1.id })
      PetApplication.create({ pet_id: @pet1.id, application_id: @application2.id })

      visit "/shelters/#{@shelter1.id}"

      expect(page).to have_content('Open Pet Applications: 2')
    end
  end
end

# As a visitor
# When I visit a shelter's show page
# I see statistics for that shelter, including:
# - count of pets that are at that shelter
# - average shelter review rating
# - number of applications on file for that shelter
