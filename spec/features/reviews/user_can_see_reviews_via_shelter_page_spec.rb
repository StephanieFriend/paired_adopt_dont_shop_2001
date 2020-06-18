# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can see shelter reviews via the shelter show page' do
    visit "/shelters/#{@shelter1.id}"

    expect(page).to have_content(@review1.title)
    expect(page).to have_content(@review1.rating)
    expect(page).to have_content(@review1.content)
    expect(page).to have_content(@review2.content)
  end
end
