require 'rails_helper'

Rspec.describe "reviews edit process" do
  it "can take a user to reviews edit page" do
    visit("/shelters/#{@shelter.id}")

    click_link("Edit Review")

    expect(current_path).to eq("/reviews/#{@review_1.id}/edit")
  end

  it "user can see a form to edit review data" do

    visit("/reviews/#{@review_1.id}/edit")

    expect(page).to have_selector("form")
    expect(page).to have_field("Title", with: @shelter_1.name)
    expect(page).to have_field("Rating", with: @shelter_1.address)
    expect(page).to have_field("Content", with: @shelter_1.city)
  end

  it "user can complete edit update with PATCH and redirect" do

    visit("/reviews/#{@review_1.id}/edit")

    fill_in "Title", with: "Testing Update"

    click_button "Submit"

    expect(current_path).to eq("/shelters/#{@review_1.shelter.id}")
    expect(page).to have_content("Update name test")
    expect(page).to_not have_content("This is Awesome")
  end

  it "user can see an error message when the form is not complete (title)" do

    visit("/reviews/#{@review_1.id}/edit")

    fill_in 'Title', with: ""

    click_button 'Submit'

    expect(current_path).to eq("/reviews/#{@review_1.id}/edit")

    expect(page).to have_content("Not all required fields are met")
  end

  it "user can see an error message when the form is not complete (rating)" do

    visit("/reviews/#{@review_1.id}/edit")

    fill_in 'Rating', with: ""

    click_button 'Submit'

    expect(current_path).to eq("/reviews/#{@review_1.id}/edit")

    expect(page).to have_content("Not all required fields are met")
  end

  it "user can see an error message when the form is not complete (Content)" do

    visit("/reviews/#{@review_1.id}/edit")

    fill_in 'Content', with: ""

    click_button 'Submit'

    expect(current_path).to eq("/reviews/#{@review_1.id}/edit")

    expect(page).to have_content("Not all required fields are met")
  end
end
