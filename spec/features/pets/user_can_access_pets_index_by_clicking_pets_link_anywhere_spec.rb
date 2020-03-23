require 'rails_helper'

RSpec.describe "all pages" do
  it "have a pets link that redirects to the pets index" do

    visit "/"
    expect(page).to have_link('Pets')
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/shelters"
    expect(page).to have_link('Pets')
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_link('Pets')
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/shelters/#{@shelter_1.id}/pets"
    expect(page).to have_link('Pets')
    click_link 'Pets'
    expect(current_path).to eq('/pets')

    visit "/pets/#{@pet_1.id}"
    expect(page).to have_link('Pets')
    click_link 'Pets'
    expect(current_path).to eq('/pets')
  end
end
