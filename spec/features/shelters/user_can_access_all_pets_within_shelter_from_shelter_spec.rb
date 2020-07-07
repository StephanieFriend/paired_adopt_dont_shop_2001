# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shelter show page', type: :feature do
  it 'has a Pets at This Shelter link that redirects you to the shelters pet view ' do
    visit "/shelters/#{@shelter1.id}"
    click_link('Pets at This Shelter')
    expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")

    visit "/shelters/#{@shelter2.id}"
    click_link('Pets at This Shelter')
    expect(current_path).to eq("/shelters/#{@shelter2.id}/pets")
  end
end
