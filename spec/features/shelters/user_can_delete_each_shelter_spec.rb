require 'rails_helper'

RSpec.describe "shelter delete process", type: :feature do
  before(:each) do
    @application_1 = Application.create( name: "Mary Margret",
                                         address: "123 Charming Ln.",
                                         city: "Storybrooke",
                                         state: "ME",
                                         zip: "54321",
                                         phone_number: "123-456-7890",
                                         description: "I'm Snow White. Duh.")

    PetApplication.create({pet_id: @pet_1.id, application_id: @application_1.id})
  end

  it "can complete deletion with DELETE and redirect" do

    visit "/applications/#{@application_1.id}"

    expect(page).to have_content("Approve Application For: #{@pet_1.name}")

    visit "/shelters/#{@shelter_1.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content(@shelter_1.name)
    expect(page).to_not have_content(@pet_1.name)

  end
end
