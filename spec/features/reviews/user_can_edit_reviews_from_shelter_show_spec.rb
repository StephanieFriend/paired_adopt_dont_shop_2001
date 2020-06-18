# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews edit process' do
  # need to test with css tag
  # it "can take a user to reviews edit page" do
  #   visit("/shelters/#{@shelter1.id}")
  #
  #   click_link("Edit Review")
  #
  #   expect(current_path).to eq("/reviews/#{@review1.id}/edit")
  # end

  it 'user can see a form to edit review data' do
    visit("/reviews/#{@review1.id}/edit")

    expect(page).to have_selector('form')
    expect(page).to have_field('Title', with: @review1.title)
    expect(page).to have_field('Content', with: @review1.content)
  end

  it 'user can complete edit update with PATCH and redirect' do
    visit("/reviews/#{@review1.id}/edit")

    fill_in 'Title', with: 'Update title test'

    click_button 'Submit'

    expect(current_path).to eq("/shelters/#{@review1.shelter.id}")
    expect(page).to have_content('Update title test')
    expect(page).to_not have_content('This is Awesome')
  end

  it 'user can see an error message when the form is not complete (title)' do
    visit("/reviews/#{@review1.id}/edit")

    fill_in 'Title', with: ''

    click_button 'Submit'

    expect(current_path).to eq("/reviews/#{@review1.id}/edit")

    expect(page).to have_content('All fields are required')
  end

  it 'user can see an error message when the form is not complete (Content)' do
    visit("/reviews/#{@review1.id}/edit")

    fill_in 'Content', with: ''

    click_button 'Submit'

    expect(current_path).to eq("/reviews/#{@review1.id}/edit")

    expect(page).to have_content('All fields are required')
  end
end
