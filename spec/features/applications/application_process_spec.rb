require 'rails_helper'

RSpec.describe "Can submit adoption application", type: :feature do
  before(:each) do
    visit "/pets/#{@pet_1.id}"
    click_on('Favorite This Pet')

    visit "/pets/#{@pet_2.id}"
    click_on('Favorite This Pet')
  end

  it "After favoriting pets can view application form to adopt" do

    visit "/favorites"

    click_link('Adopt Favorited Pets')
    expect(current_path).to eq('/applications/new')
  end

  it "I can select multiple favorited pet to adopt by filling in application like this" do

    visit "/applications/new"

    expect(page).to have_css("#checkbox-#{@pet_1.id}")
    expect(page).to have_css("#checkbox-#{@pet_2.id}")
    expect(page).to_not have_css("#checkbox-#{@pet_3.id}")
    expect(page).to_not have_css("#checkbox-#{@pet_3.id}")
  end

  it "can fill in info and be redirected to favorites page with flash message and no longer see pets that have been applied for" do

    visit "/applications/new"

    find("#checkbox-#{@pet_2.id}").set(true)

    fill_in :name, with: "Test Address"
    fill_in :address, with: "Test Address"
    fill_in :city, with: "Test City"
    fill_in :state, with: "Test State"
    fill_in :zip, with: "Test Zip"
    fill_in :phone_number, with: "Test Number "
    fill_in :description, with: "Test Description"

    click_button 'Submit'

    expect(current_path).to eq("/favorites")

    expect(page).to have_content("Your application for the selected pets has been submitted.")

    expect(page).not_to have_content(@pet_2.name)
    expect(page).to have_content(@pet_1.name)
  end
end
