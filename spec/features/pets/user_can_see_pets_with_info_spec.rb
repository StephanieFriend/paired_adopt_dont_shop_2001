require "rails_helper"

RSpec.describe "pet show page", type: :feature do
  it "can see pet with image name description age sex status" do

    visit "/pets/#{@pet_1.id}"

    expect(page).to have_css("img[src*='#{@pet_1.image}']")
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.description)
    expect(page).to have_content(@pet_1.age)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.status)

    expect(page).to_not have_content(@pet_2.name)
    expect(page).to_not have_content(@pet_2.description)
    expect(page).to_not have_content(@pet_2.age)
    expect(page).to_not have_content(@pet_2.sex)
  end

  it "can see another pet with all info" do

    visit "/pets/#{@pet_2.id}"

    expect(page).to have_css("img[src*='#{@pet_2.image}']")
    expect(page).to have_content(@pet_2.name)
    expect(page).to have_content(@pet_2.description)
    expect(page).to have_content(@pet_2.age)
    expect(page).to have_content(@pet_2.sex)
    expect(page).to have_content(@pet_2.status)

    expect(page).to_not have_content(@pet_1.name)
    expect(page).to_not have_content(@pet_1.description)
    expect(page).to_not have_content(@pet_1.age)
    expect(page).to_not have_content(@pet_1.sex)
  end
end
