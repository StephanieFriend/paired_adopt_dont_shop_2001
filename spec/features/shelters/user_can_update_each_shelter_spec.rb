# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shelter update process', type: :feature do
  it "can take a user to '/shelters/:id/edit'" do
    visit "/shelters/#{@shelter1.id}"

    click_link 'Edit Shelter'

    expect(current_path).to eq("/shelters/#{@shelter1.id}/edit")
  end

  it "can see a form to edit shelter's data" do
    visit "/shelters/#{@shelter1.id}/edit"

    expect(page).to have_selector('form')
    expect(page).to have_field('name', with: @shelter1.name)
    expect(page).to have_field('address', with: @shelter1.address)
    expect(page).to have_field('city', with: @shelter1.city)
    expect(page).to have_field('state', with: @shelter1.state)
    expect(page).to have_field('zip', with: @shelter1.zip)
  end

  it 'can complete update with PATCH and redirect' do
    visit "/shelters/#{@shelter1.id}/edit"

    fill_in 'name', with: 'Testing Update'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter1.id}")
    expect(page).to have_content('Testing Update')
    expect(page).to_not have_content('Pet Palace')
  end
end
