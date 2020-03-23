require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can click on pet name and be redirected to the pet show page" do

    visit '/pets'

    expect(page).to have_link(@pet_1.name)
    expect(page).to have_link(@pet_2.name)
    expect(page).to have_link(@pet_3.name)
    expect(page).to have_link(@pet_4.name)

    click_link("#{@pet_1.name}")

    expect(current_path).to eq("/pets/#{@pet_1.id}")
  end

  it "can click on pet name in shelter-pets index and be redirected to the pet show page" do

    visit "/shelters/#{@shelter_1.id}/pets"

    click_link("#{@pet_1.name}")

    expect(current_path).to eq("/pets/#{@pet_1.id}")
  end
end
