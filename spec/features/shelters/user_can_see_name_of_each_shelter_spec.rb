require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters" do

    visit "/shelters"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)  
  end
end
