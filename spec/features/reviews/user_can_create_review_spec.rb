# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can create a new review via the shelters show page' do
    visit "/shelters/#{@shelter1.id}"

    click_link 'Add New Review'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews")

    fill_in :title, with: 'Very Happy!'
    choose(option: 4)
    fill_in :content, with: 'Great place to adopt a puppy! (Not great on kitties though.)'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter1.id}")

    expect(page).to have_content('Very Happy')
    expect(page).to have_content('Great place to adopt a puppy! (Not great on kitties though.)')
  end

  it 'I see a flash message that all fields are required when missing input' do
    visit "/shelters/#{@shelter1.id}"

    click_link('Add New Review')

    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews")

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/reviews")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Rating can't be blank")
    expect(page).to have_content("Content can't be blank")
  end
end
