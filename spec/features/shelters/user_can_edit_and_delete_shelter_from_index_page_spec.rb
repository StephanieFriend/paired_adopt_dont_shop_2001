require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "has links to edit and delete each shelter" do

    visit '/shelters'

    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end
