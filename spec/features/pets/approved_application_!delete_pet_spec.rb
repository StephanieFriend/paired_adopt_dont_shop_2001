# frozen_string_literal: true

require 'rails_helper'

describe 'As a visitor' do
  before :each do
    @application1 = Application.create(
      name: 'Test App Name',
      address: 'Test App Address',
      city: 'Test App City',
      state: 'Test App State',
      zip: 'Test App Zip',
      phone_number: 'Test App Number',
      description: 'Test App Description!'
    )
    @application1.pets << [@pet1]

    visit("/applications/#{@application1.id}")

    click_link("Approve Application For: #{@pet1.name}")
  end

  it 'button for deletion does not show on pet index page' do
    visit('/pets')

    expect(page).not_to have_link('Delete Pet')
  end

  it 'button for deletion does not show on pet show page' do
    visit("/pets/#{@pet1.id}")
    expect(page).not_to have_link('Delete Pet')
  end
end
