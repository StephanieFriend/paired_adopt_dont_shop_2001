# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'If a shelter does not have any pets with a pending status I can delete that shelter' do
    before(:each) do
      @application2 = Application.create(name: 'Dr. Hopper',
                                          address: '241 Cricket Dr.',
                                          city: 'Storybrooke',
                                          state: 'ME',
                                          zip: '54321',
                                          phone_number: '098-765-4321',
                                          description: 'This Cricket would like a friend to play with!')
      @application3 = Application.create(name: 'Regina Mills',
                                          address: '873 Queen Ave.',
                                          city: 'Storybrooke',
                                          state: 'ME',
                                          zip: '54321',
                                          phone_number: '321-654-0987',
                                          description: "I'm the Evil Queen trying to turn over a new leaf.")

      PetApplication.create({ pet_id: @pet1.id, application_id: @application2.id })
      PetApplication.create({ pet_id: @pet2.id, application_id: @application3.id })
    end
    it 'When the shelter is deleted all the pets with the shelter is also deleted' do
      visit "/applications/#{@application2.id}"

      expect(page).to have_content("Approve Application For: #{@pet1.name}")

      visit "/applications/#{@application3.id}"

      expect(page).to have_content("Approve Application For: #{@pet2.name}")

      visit "/shelters/#{@shelter1.id}"

      click_link 'Delete Shelter'

      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content("/shelters/#{@shelter1.name}")

      visit '/pets'

      expect(page).to_not have_content(@pet1.name)
      expect(page).to_not have_content(@pet2.name)
      expect(page).to have_content(@pet3.name)
    end
    it 'I cannot delete a shelter if a pet has pending status' do
      visit "/applications/#{@application2.id}"

      click_link "Approve Application For: #{@pet1.name}"

      visit "/shelters/#{@shelter1.id}"

      click_link 'Delete Shelter'

      expect(current_path).to eq("/shelters/#{@shelter1.id}")
      expect(page).to have_content('Cannot Delete A Shelter With Pending Applications.')
    end
  end
end
