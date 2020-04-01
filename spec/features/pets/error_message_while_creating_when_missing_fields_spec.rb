require 'rails_helper'

RSpec.describe "Creating Pet" do
  it "I see a flash message if fields are incomplete to create a pet" do

    visit "/shelters/#{@shelter_1.id}/pets/new"

    fill_in 'name', with: "Test"
    fill_in 'description', with: "Test Description"
    fill_in 'age', with: "2"
    fill_in 'sex', with: "male"

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets/new")
    expect(page).to have_content("Image can't be blank")
  end
  it "I see a flash message if fields are incomplete to edit a pet" do

    visit "/pets/#{@pet_1.id}/edit"

    fill_in 'name', with: ""

    click_button 'Submit'

    expect(page).to have_content("Name can't be blank")
  end
end
