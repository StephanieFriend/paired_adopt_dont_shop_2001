# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit a pet show page I see a link to view all applications for that pet' do
    before(:each) do
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

      @application3 = Application.create(name: 'Regina Mills',
                                          address: '873 Queen Ave.',
                                          city: 'Storybrooke',
                                          state: 'ME',
                                          zip: '54321',
                                          phone_number: '321-654-0987',
                                          description: "I'm the Evil Queen trying to turn over a new leaf.")

      PetApplication.create({ pet_id: @pet1.id, application_id: @application1.id })
      PetApplication.create({ pet_id: @pet1.id, application_id: @application2.id })
      PetApplication.create({ pet_id: @pet2.id, application_id: @application3.id })
    end

    it 'When I click the link I see a list of all the names of applicants for the pet' do
      visit "/pets/#{@pet1.id}"

      click_link 'View All Applications'

      expect(current_path).to eq("/pets/#{@pet1.id}/pet_applications")
      expect(page).to have_content(@application1.name)
      expect(page).to have_content(@application2.name)
      expect(page).to_not have_content(@application3.name)
    end

    it 'I see a message when no applications have been submitted for this pet' do
      visit "/pets/#{@pet4.id}"

      click_link 'View All Applications'

      expect(current_path).to eq("/pets/#{@pet4.id}/pet_applications")
      expect(page).to have_content('This pet has no current applications')
    end
  end
end
