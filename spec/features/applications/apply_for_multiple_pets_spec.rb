# require 'rails_helper'
#
# describe "As a visitor" do
#   before :each do
#
  # @application_1 = Application.create(
  #                         name:  "Test App Name",
  #                         address: "Test App Address",
  #                         city: "Test App City",
  #                         state: "Test App State",
  #                         zip: "Test App Zip",
  #                         phone_number: "Test App Number",
  #                         description: "Test App Description!",
  #                         )
#
#     @application_1.pets << [@pet_1, @pet_2]
#   end
#
#   it "can approve the application for any number of pets" do
#
#     visit "/applications/#{@application_1.id}"
#
#     click_link "Approve Application For: #{@pet_1.name}"
#     expect(current_path).to eq "/pets/#{@pet_1.id}"
#
#     expect(page).to have_content "Adoptable: pending"
#     # expect(page).to have_content "On hold for #{@application_1.name}"
#
#     visit "/applications/#{@application_1.id}"
#
#     click_link "Approve Application For: #{@pet_2.name}"
#     expect(current_path).to eq "/pets/#{@pet_2.id}"
#
#     expect(page).to have_content "Adoptable: pending"
#     # expect(page).to have_content "On hold for #{@application_1.name}"
#     end
#   end
