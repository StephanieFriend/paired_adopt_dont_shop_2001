require 'rails_helper'

RSpec.describe "Application show page " do
  it "can see all name, address, city, state, zip, phone_number, description, and names of pets as links" do

    application_1 = Application.create(
                          name:  "Test Name",
                          address: "Test Address",
                          city: "Test City",
                          state: "Test State",
                          zip: "Test Zip",
                          phone_number: "Test Number",
                          description: "Test Description!",
                        )
                        
    PetApplication.create({pet_id: @pet_1.id, application_id: application_1.id})

    visit "/applications/#{application_1.id}"
    expect(page).to have_content(application_1.name)
    expect(page).to have_content(application_1.address)
    expect(page).to have_content(application_1.city)
    expect(page).to have_content(application_1.state)
    expect(page).to have_content(application_1.zip)
    expect(page).to have_content(application_1.phone_number)
    expect(page).to have_content(application_1.description)

    expect(page).to have_link(@pet_1.name, href: "/pets/#{@pet_1.id}")
    expect(page).not_to have_link(@pet_2.name)
  end
end
