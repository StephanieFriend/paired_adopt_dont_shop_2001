# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shelters index page', type: :feature do
  it 'can click on shelter name within shelters' do
    visit '/shelters'

    expect(page).to have_link(@shelter1.name)
    expect(page).to have_link(@shelter2.name)
  end

  it 'can click on shelter name in within pets' do
    visit '/pets'

    expect(page).to have_link(@shelter1.name)
    expect(page).to have_link(@shelter2.name)
  end
end
