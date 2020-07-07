# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pets index page', type: :feature do
  it 'can see each pet with image name age sex shelter' do
    visit '/pets'

    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@pet1.shelter.name)

    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.age)
    expect(page).to have_content(@pet2.sex)
    expect(page).to have_content(@pet2.shelter.name)
  end
end
