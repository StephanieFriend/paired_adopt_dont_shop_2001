# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shelter pets index page', type: :feature do
  it 'can see all pets from shelter' do
    visit "/shelters/#{@shelter1.id}/pets"

    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.age)
    expect(page).to have_content(@pet1.sex)

    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.age)
    expect(page).to have_content(@pet2.sex)

    expect(page).not_to have_content(@pet3.name)
    expect(page).not_to have_content(@pet4.name)

    visit "/shelters/#{@shelter2.id}/pets"

    expect(page).to have_content(@pet4.name)
    expect(page).to have_content(@pet4.age)
    expect(page).to have_content(@pet4.sex)

    expect(page).not_to have_content(@pet1.age)
    expect(page).not_to have_content(@pet2.age)
  end
end
