require 'rails_helper'

RSpec.describe "Application approval process" do
  before(:each) do
    @application_1 = Application.create(
                          name:  "Test App Name",
                          address: "Test App Address",
                          city: "Test App City",
                          state: "Test App State",
                          zip: "Test App Zip",
                          phone_number: "Test App Number",
                          description: "Test App Description!",
                          )
    @application_2 = Application.create(
                          name:  "Test App Name2",
                          address: "Test App Address2",
                          city: "Test App City2",
                          state: "Test App State2",
                          zip: "Test App Zip2",
                          phone_number: "Test App Number2",
                          description: "Test App Description!2",
                          )

    PetApplication.create({pet_id: @pet_1.id, application_id: @application_1.id})
    PetApplication.create({pet_id: @pet_2.id, application_id: @application_1.id})
    PetApplication.create({pet_id: @pet_1.id, application_id: @application_2.id})
    PetApplication.create({pet_id: @pet_2.id, application_id: @application_2.id})
  end

  describe "can click on link to approve the application for one specific pet" do
    it "rerouted to that pet's show page and see pending status with applicant's name" do

      visit "/applications/#{@application_1.id}"

      # within("#pet-links#{@pet_1.id}") do
      expect(page).to have_link("Approve Application For:")

      click_link "Approve Application For: #{@pet_1.name}"

      expect(current_path).to eq "/pets/#{@pet_1.id}"

      expect(page).to have_content "pending"
      expect(page).to have_content("On Hold For:")
      expect(page).to have_content("#{@application_1.name}")
    end
  end

  it "can not approve any other applications for that pet but all other applications still remain on file" do

    visit "/applications/#{@application_1.id}"

    click_link "Approve Application For: #{@pet_2.name}"
    expect(current_path).to eq "/pets/#{@pet_2.id}"

    expect(page).to have_content "pending"
    expect(page).to have_content("On Hold For:")
    expect(page).to have_content("#{@application_1.name}")

    visit "/applications/#{@application_2.id}"

    click_link "Approve Application For: #{@pet_2.name}"

    expect(page).to have_content('Not Taking New Applications At This Time')
    expect(page).to have_link("Approve Application For: #{@pet_1.name}")

    visit "/pets/#{@pet_2.id}/pet_applications"
    expect(page).to have_content(@application_1.name)
    expect(page).to have_content(@application_2.name)
  end
end
# end
