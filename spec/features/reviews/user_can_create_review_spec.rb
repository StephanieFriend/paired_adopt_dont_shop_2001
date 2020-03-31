require 'rails_helper'

RSpec.describe 'As a Visitor' do
  # it 'I can create a new review via the shelters show page' do
  #
  #   visit "/shelters/#{@shelter_1.id}"
  #
  #   click_link 'Add New Review'
  #
  #   expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews")
  #
  #   fill_in :title, with: "Very Happy!"
  #   select '5', from: :rating
  #   fill_in :content, with: "Great place to adopt a puppy! (Not great on kitties though.)"
  #
  #   click_button 'Submit'
  #
  #   expect(current_path).to eq("/shelters/#{@shelter_1.id}")
  #
  #   expect(page).to have_content("Very Happy")
  #   expect(page).to have_content("Great place to adopt a puppy! (Not great on kitties though.)")
  # end

  it "I see a flash message that all fields are required when missing input" do

    visit "/shelters/#{@shelter_1.id}"

    click_link('Add New Review')

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews")

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/reviews")
    expect(page).to have_content("All fields are required")
  end
end
