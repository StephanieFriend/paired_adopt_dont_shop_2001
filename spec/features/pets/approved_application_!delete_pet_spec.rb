require 'rails_helper'

describe "As a visitor" do
  before :each do

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

    visit("/applications/#{@application_1.id}")

    click_button("Approve Application For: #{@pet_1.name}")
  end

   it "button for deletion does not show on pet index page" do

     visit('/pets')

     expect(page).to have_button('Delete Pet', count: 2)
   end

   it "button for deletion does not show on pet show page" do

     visit("/pets/#{@pet_1.id}")
     expect(page).not_to have_button('Delete Pet')
   end
end
