# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'all pages', type: :feature do
  it 'have a shelters link that redirects to shelter index' do
    visit '/'
    expect(page).to have_link('Shelters')
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit '/shelters'
    expect(page).to have_link('Shelters')
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit "/shelters/#{@shelter1.id}"
    expect(page).to have_link('Shelters')
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit "/shelters/#{@shelter1.id}/pets"
    expect(page).to have_link('Shelters')
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')

    visit "/shelters/#{@shelter1.id}"
    expect(page).to have_link('Shelters')
    click_link 'Shelters'
    expect(current_path).to eq('/shelters')
  end
end
