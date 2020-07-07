# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pet update process', type: :feature do
  it 'can take a user to /pets/id/edit' do
    visit "/pets/#{@pet1.id}"

    expect(page).to have_link('Edit')

    click_link 'Edit'

    expect(current_path).to eq("/pets/#{@pet1.id}/edit")
  end

  it 'can complete update with Patch and redirect' do
    visit "/pets/#{@pet1.id}/edit"

    fill_in 'name', with: 'Update name test'

    click_button 'Submit'

    expect(current_path).to eq("/pets/#{@pet1.id}")

    expect(page).to have_content('Update name test')
    expect(page).not_to have_content('Name: Test name 1')
  end
end
