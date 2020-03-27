# require 'rails_helper'
#
# RSpec.describe 'As a Visitor' do
#   it 'I can create a new review via the shelters show page' do
#
#     visit "/shelters/#{@shelter_1.id}"
#
#     click_link 'Add New Review'
#
#     expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews")
#
#
#     fill_in :title, with: "Very Happy!"
#     fill_in :content, with: "Great place to adopt a puppy! (Not great on kitties though.)"
#     fill_in :image, with: "https://lh3.googleusercontent.com/proxy/VH2o2pIhKaUrNNs8PUtOHgayKXVKlaF2lObH0Xmq06RQAu4b4T_U-ZwKqWRd8aSs4-q7WW9-P8JuFPqIvsVwqGMQrL51Q4y7s4GaXx2HZUtYKwYtxlFmwlLH4-aPDkOCMd1lK72FqL75-Viyg_F2NnLs-wypnocyYz0QrEk_f8PDHiZNVIN5WilLHZAir1RFiM617jhlogVQVln6oppZWEWUFk4e7K5CIzJiIbc8LItt6nYmIg"
#
#     click_button 'Submit'
#
#     expect(current_path).to eq("/shelters/#{@shelter_1.id}")
#     expect(page).to have_content("Very Happy")
#     expect(page).to have_content("Great place to adopt a puppy! (Not great on kitties though.)")
#   end

#   it "I see a flash message that all fields are required when missing input" do
#
#     visit "/shelters/#{@shelter_1.id}"
#
#     click_link('Add New Review')
#
#     expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews")
#
#     click_button 'Submit'
#
#     expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews")
#     expect(page).to have_content("All fields are required")
#   end
# end
