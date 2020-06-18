# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pets index page', type: :feature do
  it 'can click on pet name and be redirected to the pet show page' do
    visit '/pets'

    expect(page).to have_link(@pet1.name)
    expect(page).to have_link(@pet2.name)
    expect(page).to have_link(@pet3.name)
    expect(page).to have_link(@pet4.name)

    click_link(@pet1.name.to_s)

    expect(current_path).to eq("/pets/#{@pet1.id}")
  end

  it 'can click on pet name in shelter-pets index and be redirected to the pet show page' do
    visit "/shelters/#{@shelter1.id}/pets"

    click_link(@pet1.name.to_s)

    expect(current_path).to eq("/pets/#{@pet1.id}")
  end
end
