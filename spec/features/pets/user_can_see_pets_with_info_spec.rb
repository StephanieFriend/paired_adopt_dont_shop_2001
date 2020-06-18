# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pet show page', type: :feature do
  it 'can see pet with image name description age sex status' do
    visit "/pets/#{@pet1.id}"

    expect(page).to have_css("img[src*='#{@pet1.image}']")
    expect(page).to have_content(@pet1.name)
    expect(page).to have_content(@pet1.description)
    expect(page).to have_content(@pet1.age)
    expect(page).to have_content(@pet1.sex)
    expect(page).to have_content(@pet1.status)

    expect(page).to_not have_content(@pet2.name)
    expect(page).to_not have_content(@pet2.description)
    expect(page).to_not have_content(@pet2.age)
    expect(page).to_not have_content(@pet2.sex)
  end

  it 'can see another pet with all info' do
    visit "/pets/#{@pet2.id}"

    expect(page).to have_css("img[src*='#{@pet2.image}']")
    expect(page).to have_content(@pet2.name)
    expect(page).to have_content(@pet2.description)
    expect(page).to have_content(@pet2.age)
    expect(page).to have_content(@pet2.sex)
    expect(page).to have_content(@pet2.status)

    expect(page).to_not have_content(@pet1.name)
    expect(page).to_not have_content(@pet1.description)
    expect(page).to_not have_content(@pet1.age)
    expect(page).to_not have_content(@pet1.sex)
  end
end
