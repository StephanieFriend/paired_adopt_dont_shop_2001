require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'All shelter reviews are deleted when I delete a shelter' do

    visit "/shelters/#{@shelter_2.id}"

    click_link 'Delete Shelter'

    expect(Review.exists?(@review_3.id)).to be_falsy
  end
end