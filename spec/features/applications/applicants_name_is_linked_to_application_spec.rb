# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Applicants name link', type: :feature do
  before(:each) do
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
  end

  it 'pet show page after approval it is a link to their application show page' do
    visit "/applications/#{@application1.id}"

    click_on "Approve Application For: #{@pet1.name}"

    visit "/pets/#{@pet1.id}"

    expect(page).to have_link(@application1.name.to_s, href: "/applications/#{@application1.id}")
  end
end
