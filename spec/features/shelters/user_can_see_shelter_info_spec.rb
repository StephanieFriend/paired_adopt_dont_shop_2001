# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shelter show page', type: :feature do
  it 'can see shelter with name address city state zip' do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@shelter1.name)
    expect(page).to have_content('Address:')
    expect(page).to have_content(@shelter1.address.to_s)
    expect(page).to have_content('City:')
    expect(page).to have_content(@shelter1.city.to_s)
    expect(page).to have_content('State:')
    expect(page).to have_content(@shelter1.state.to_s)
    expect(page).to have_content(@shelter1.state.to_s)
    expect(page).to have_content('Zip:')

    visit "/shelters/#{@shelter2.id}"

    expect(page).to have_content(@shelter2.name)
    expect(page).to have_content('Address:')
    expect(page).to have_content(@shelter2.address.to_s)
    expect(page).to have_content('City:')
    expect(page).to have_content(@shelter2.city.to_s)
    expect(page).to have_content('State:')
    expect(page).to have_content(@shelter2.state.to_s)
    expect(page).to have_content('Zip:')
    expect(page).to have_content(@shelter2.zip.to_s)
  end
end
