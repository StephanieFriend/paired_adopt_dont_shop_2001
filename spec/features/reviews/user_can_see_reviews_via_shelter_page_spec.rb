require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can see shelter reviews via the shelter show page' do

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(@review_1.title)
    expect(page).to have_content(@review_1.rating)
    expect(page).to have_content(@review_1.content)
    expect(page).to have_content(@review_2.content)
  end

end