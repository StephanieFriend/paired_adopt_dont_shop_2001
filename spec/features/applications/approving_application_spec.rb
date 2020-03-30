require 'rails_helper'

RSpec.describe "Application approval process" do
  before(:each) do
    @application_1 = Application.create(
      name:  "Test Name",
      address: "Test Address",
      city: "Test City",
      state: "Test State",
      zip: "Test Zip",
      phone_number: "Test Number",
      description: "Test Description!",
    )

    @application_2 = Application.create(
      name:  "Test Name2",
      address: "Test Address2",
      city: "Test City2",
      state: "Test State2",
      zip: "Test Zip2",
      phone_number: "Test Number2",
      description: "Test Description!2",
    )

    @application_1.pets << [@pet_1, @pet_2]
    @application_2.pets << [@pet_1, @pet_2]

  end

  describe "can click on link to approve the application for one specific pet" do
    it "rerouted to that pet's show page and see pending status with applicant's name" do

      visit "/applications/#{@application_1.id}"

      within("#pet-links#{@pet_1.id}") do
        expect(page).to have_link("Approve application for: #{@pet_1.name}")
        click_link "Approve Application For: #{@pet_1.name}"
      end

      click_link "Approve Application For: #{@pet_1.name}"
      expect(current_path).to eq "/pets/#{@pet_1.id}"

      expect(page).to have_content "Adoptable Status: Pending"
      expect(page).to have_content "On hold for #{@application_1.name}"
    end
  end

  it "can not approve any other applications for that pet but all other applications still remain on file" do

    visit "/applications/#{@application_1.id}"

    click_link "Approve application for: #{@pet_2.name}"
    expect(current_path).to eq "/pets/#{@pet_2.id}"

    expect(page).to have_content "Adoptable: pending"
    expect(page).to have_content "On hold for #{@application_1.name}"

    visit "/applications/#{@application_2.id}"
    expect(page).not_to have_link("Approve application for: #{@pet_2.name}")
    expect(page).to have_link("Approve application for: #{@pet_1.name}")

    visit "/pets/#{@pet_2.id}/applications" 
    expect(page).to have_content(@application_1.name)
    expect(page).to have_content(@application_2.name)
  end
end
