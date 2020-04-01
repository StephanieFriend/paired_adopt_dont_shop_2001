require 'rails_helper'


RSpec.describe 'Applicants name link', type: :feature do
  before(:each) do

    @application_1 = Application.create(
                            name:  "Test App Name",
                            address: "Test App Address",
                            city: "Test App City",
                            state: "Test App State",
                            zip: "Test App Zip",
                            phone_number: "Test App Number",
                            description: "Test App Description!",
                            )
    @application_1.pets << [@pet_1]
  end

    it 'pet show page after approval it is a link to their application show page' do

      visit "/applications/#{@application_1.id}"

      click_on "Approve Application For: #{@pet_1.name}"

      visit "/pets/#{@pet_1.id}"

      expect(page).to have_link("#{@application_1.name}", href: "/applications/#{@application_1.id}")
    end
  end
