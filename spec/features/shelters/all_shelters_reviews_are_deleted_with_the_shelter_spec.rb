# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  it 'All shelter reviews are deleted when I delete a shelter' do
    visit "/shelters/#{@shelter2.id}"

    click_link 'Delete Shelter'

    expect(Review.exists?(@review3.id)).to be_falsy
  end
end
