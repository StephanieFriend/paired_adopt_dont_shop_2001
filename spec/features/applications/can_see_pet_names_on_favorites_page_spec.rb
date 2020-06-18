# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I see a section on the favorites page that has the applied for pets name with links to their show page' do
    visit "/pets/#{@pet3.id}"

    click_on('Favorite This Pet')

    visit '/favorites'

    click_link 'Adopt Favorited Pets'

    find("#checkbox-#{@pet3.id}").set(true)

    fill_in :name, with: 'Test Address'
    fill_in :address, with: 'Test Address'
    fill_in :city, with: 'Test City'
    fill_in :state, with: 'Test State'
    fill_in :zip, with: 'Test Zip'
    fill_in :phone_number, with: 'Test Number '
    fill_in :description, with: 'Test Description'

    click_button 'Submit'

    expect(current_path).to eq('/favorites')
    expect(page).to have_content(@pet3.name)
    expect(page).to_not have_content(@pet2.name)
    expect(page).to_not have_content(@pet3.sex)
  end
end
