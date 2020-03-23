require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "has a Pets at This Shelter link that redirects you to the shelters pet view " do

    visit "/shelters/#{@shelter_1.id}"
    click_link("Pets at This Shelter")
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")

    visit "/shelters/#{@shelter_2.id}"
    click_link("Pets at This Shelter")
    expect(current_path).to eq("/shelters/#{@shelter_2.id}/pets")
  end
end
