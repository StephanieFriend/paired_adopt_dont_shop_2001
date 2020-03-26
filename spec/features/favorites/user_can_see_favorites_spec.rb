require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I see a favorite indicator in my navigation bar' do
    visit '/'

    within('#favorite-indicator') do
      expect(page).to have_content("Favorite Count: #{Pet.favorites_count}")
    end
    expect(@pet_1.favorite?).to be_truthy
  end
end