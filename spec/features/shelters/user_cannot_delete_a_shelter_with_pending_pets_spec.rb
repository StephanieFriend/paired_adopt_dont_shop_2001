# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @application1 = Application.create(name: 'Mary Margret',
                                        address: '123 Charming Ln.',
                                        city: 'Storybrooke',
                                        state: 'ME',
                                        zip: '54321',
                                        phone_number: '123-456-7890',
                                        description: "I'm Snow White. Duh.")

    PetApplication.create({ pet_id: @pet1.id, application_id: @application1.id })
  end

  it 'I cannot delete a shelter if a pet has an approved application' do
    visit "/applications/#{@application1.id}"

    click_link "Approve Application For: #{@pet1.name}"

    visit "/shelters/#{@shelter1.id}"

    click_link 'Delete Shelter'

    expect(page).to have_content('Cannot Delete A Shelter With Pending Applications.')
  end
end
