require 'rails_helper'

describe "Application approval process" do
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

    @application_1.pets << [@pet_1, @pet_2]
  end

  describe "within application's show page" do
    it "I see a link to approve the application for a specific pet" do

      visit "/applications/#{@application_1.id}"

      within("#pet-links-#{@pet_1.id}") do
        expect(page).to have_link("Approve Application for: #{@pet_1.name}")
      end

      within("#pet-links-#{@pet_2.id}") do
        expect(page).to have_link("Approve application for: #{@pet_2.name}")
      end
    end

  describe "can click on link to approve the application for one specific pet" do
    it "rerouted to that pet's show page and see pending status with applicant's name" do

      visit "/applications/#{@application_1.id}"

      click_link "Approve Application For: #{@pet_2.name}"
      expect(current_path).to eq "/pets/#{@pet_2.id}"

      expect(page).to have_content "Adoptable Status: Pending"
      expect(page).to have_content "On hold for #{@application_1.name}"
    end
    end
  end
end
