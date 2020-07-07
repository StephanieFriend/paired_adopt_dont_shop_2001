# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application show page ' do
  it 'can see all name, address, city, state, zip, phone_number, description, and names of pets as links' do
    application1 = Application.create(
      name: 'Test Name',
      address: 'Test Address',
      city: 'Test City',
      state: 'Test State',
      zip: 'Test Zip',
      phone_number: 'Test Number',
      description: 'Test Description!'
    )

    PetApplication.create({ pet_id: @pet1.id, application_id: application1.id })

    visit "/applications/#{application1.id}"
    expect(page).to have_content(application1.name)
    expect(page).to have_content(application1.address)
    expect(page).to have_content(application1.city)
    expect(page).to have_content(application1.state)
    expect(page).to have_content(application1.zip)
    expect(page).to have_content(application1.phone_number)
    expect(page).to have_content(application1.description)

    expect(page).to have_link(@pet1.name, href: "/pets/#{@pet1.id}")
    expect(page).not_to have_link(@pet2.name)
  end
end
