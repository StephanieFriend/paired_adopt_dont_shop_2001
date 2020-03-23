require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see each pet with image name age sex shelter" do

    visit '/pets'

    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.age)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.shelter.name)

    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_2.age)
    expect(page).to have_content(@pet_2.sex)
    expect(page).to have_content(@pet_2.shelter.name)
  end
end
