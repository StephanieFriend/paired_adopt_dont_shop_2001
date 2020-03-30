# require 'rails_helper'
#
# RSpec.describe "Application approval process" do
#   before(:each) do
#     @application_1 = Application.create(
#                           name:  "Test App Name",
#                           address: "Test App Address",
#                           city: "Test App City",
#                           state: "Test App State",
#                           zip: "Test App Zip",
#                           phone_number: "Test App Number",
#                           description: "Test App Description!",
#                           )
#      @application_1 = Application.create(
#                           name:  "Test App Name2",
#                           address: "Test App Address2",
#                           city: "Test App City2",
#                           state: "Test App State2",
#                           zip: "Test App Zip2",
#                           phone_number: "Test App Number2",
#                           description: "Test App Description!2",
#                           )
#
#     @application_1.pets << [@pet_1, @pet_2]
#     @application_2.pets << [@pet_1, @pet_2]
#
#   end
#
#   describe "can click on link to approve the application for one specific pet" do
#     it "rerouted to that pet's show page and see pending status with applicant's name" do
#
#       visit "/applications/#{@application_1.id}"
#
#       within("#pet-links#{@pet_1.id}") do
#         expect(page).to have_link("Approve application for: #{@pet_1.name}")
#         click_link "Approve Application For: #{@pet_1.name}"
#       end
#
#       click_link "Approve Application For: #{@pet_1.name}"
#       expect(current_path).to eq "/pets/#{@pet_1.id}"
#
#       expect(page).to have_content "Pending"
#       expect(page).to have_content "On Hold For #{@application_1.name}"
#     end
#   end
#
#   it "can not approve any other applications for that pet but all other applications still remain on file" do
#
#     visit "/applications/#{@application_1.id}"
#
#     click_link "Approve Application For: #{@pet_2.name}"
#     expect(current_path).to eq "/pets/#{@pet_2.id}"
#
#     expect(page).to have_content "Pending"
#     expect(page).to have_content "On hold for #{@application_1.name}"
#
#     visit "/applications/#{@application_2.id}"
#     expect(page).not_to have_link("Approve Application For: #{@pet_2.name}")
#     expect(page).to have_link("Approve Application For: #{@pet_1.name}")
#
#     visit "/pets/#{@pet_2.id}/applications"
#     expect(page).to have_content(@application_1.name)
#     expect(page).to have_content(@application_2.name)
#   end
# end
