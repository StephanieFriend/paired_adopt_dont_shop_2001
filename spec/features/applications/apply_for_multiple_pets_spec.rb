require 'rails_helper'

describe "As a visitor" do
  before :each do

    @application_1 = Application.create(
                        name:  "Test Name",
                        address: "Test Address",
                        city: "Test City",
                        state: "Test State",
                        zip: "Test Zip",
                        phone_number: "Test Number",
                        description: "Test Description!",
                      )

    @application_1.pets << [@pet_1, @pet_2]
  end

  it "can approve the application for any number of pets" do

    visit "/applications/#{@application_1.id}"

    click_link "Approve application for: #{@pet_1.name}"
    expect(current_path).to eq "/pets/#{@pet_1.id}"

    expect(page).to have_content "Adoptable: pending"
    # expect(page).to have_content "On hold for #{@application_1.name}"

    visit "/applications/#{@application_1.id}"

    click_link "Approve application for: #{@pet_2.name}"
    expect(current_path).to eq "/pets/#{@pet_2.id}"

    expect(page).to have_content "Adoptable: pending"
    # expect(page).to have_content "On hold for #{@application_1.name}"
    end
  end
