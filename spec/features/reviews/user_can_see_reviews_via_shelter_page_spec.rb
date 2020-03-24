require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can see shelter reviews via the shelter show page' do

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(@review_1.title)
    expect(page).to have_content(@review_1.rating)
    expect(page).to have_content(@review_1.content)
    expect(page).to have_content(@review_2.content)
  end

  # it 'I can see shelter reviews with no image provided' do
  #
  #   visit "/shelters/#{@shelter_2.id}"
  #
  #   expect(page).to have_content(@review_3.title)
  #   expect(page).to have_content(@review_3.rating)
  #   expect(page).to have_content(@review_3.content)
  #   expect(page).to_not have_content(@review_3.image)
  # end
end