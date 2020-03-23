require 'rails_helper'

RSpec.describe "create pet for shelter", type: :feature do
  it "can create pet" do

    visit "/shelters/#{@shelter_1.id}/pets"

    expect(page).to have_link("Add Adoptable Pet")
  end

  #not testing for form fields

  it "can see a form for a new pet" do

    visit "/shelters/#{@shelter_1.id}/pets"

    click_link("Add Adoptable Pet")

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")
    expect(page).to have_selector('form')
    expect(page).to have_field('image')
    expect(page).to have_field('name')
    expect(page).to have_field('description')
    expect(page).to have_field('sex')
    expect(page).to have_field('age')

  end

  it "can send POST request and new pet is listed" do

    visit "/shelters/#{@shelter_1.id}/pets/new"

    fill_in 'image', with: "https://i.imgur.com/wKls5bM.png"
    fill_in 'name', with: "Test"
    fill_in 'description', with: "Test description"
    fill_in 'age', with: "10"

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
  end
end
