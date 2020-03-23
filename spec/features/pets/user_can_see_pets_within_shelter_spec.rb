require 'rails_helper'

RSpec.describe "shelter pets index page", type: :feature do
  it "can see all pets from shelter" do

    visit "/shelters/#{@shelter_1.id}/pets"

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.age)
    expect(page).to have_content(@pet_1.sex)

    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_2.age)
    expect(page).to have_content(@pet_2.sex)

    expect(page).not_to have_content(@pet_3.name)
    expect(page).not_to have_content(@pet_4.name)

    visit "/shelters/#{@shelter_2.id}/pets"

    expect(page).to have_content(@pet_4.name)
    expect(page).to have_content(@pet_4.age)
    expect(page).to have_content(@pet_4.sex)

    expect(page).not_to have_content(@pet_1.age)
    expect(page).not_to have_content(@pet_2.age)

  end
end
