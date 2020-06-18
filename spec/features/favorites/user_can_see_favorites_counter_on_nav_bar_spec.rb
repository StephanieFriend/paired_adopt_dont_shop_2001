# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'favorites counter view', type: :feature do
  it 'can see favorites counter on pets pages' do
    visit '/pets'

    expect(page).to have_link('Favorites')
  end

  it 'can see favorites counter on pets shelter pages ' do
    visit "/shelters/#{@shelter1.id}/pets"

    expect(page).to have_link('Favorites')
  end

  it 'can see favorites counter on home pages ' do
    visit '/'

    expect(page).to have_link('Favorites')
  end
end
