require 'rails_helper'

RSpec.describe "shelter delete process", type: :feature do
  it "can complete deletion with DELETE and redirect" do

    visit "/shelters/#{@shelter_1.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content(@shelter_1.name)
    expect(page).to_not have_content(@pet_1.name)

  end
end
