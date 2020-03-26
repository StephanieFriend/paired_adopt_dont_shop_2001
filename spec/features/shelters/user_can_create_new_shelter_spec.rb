require "rails_helper"

RSpec.describe "shelters index page", type: :feature do
  it "can create shelter" do

    visit "/shelters"

    expect(page).to have_link("Create New Shelter")
  end

  it "will be taken to '/shelters/new'" do

    visit "/shelters"

    click_link "Create New Shelter"

    expect(current_path).to eq("/shelters/new")
  end

  it "can see a form for a new shelter" do

    visit "/shelters/new"

    expect(page).to have_selector("form")
    expect(page).to have_field("name")
    expect(page).to have_field("address")
    expect(page).to have_field("city")
    expect(page).to have_field("state")
    expect(page).to have_field("zip")
  end

  it "can send POST request and new shelter is listed" do

    visit "shelters/new"

    fill_in "name", with: "Test Shelter"
    fill_in "address", with: "123 Main Street"
    fill_in "city", with: "Denver"
    fill_in "state", with: "CO"
    fill_in "zip", with: "80205"

    click_button "Submit"

    #redirets to shelters show view
    # 
    # expect(current_path).to eq("/shelters")
    # expect(page).to have_content("Test Shelter")
  end
end
