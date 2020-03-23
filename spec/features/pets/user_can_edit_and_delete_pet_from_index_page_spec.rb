require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "has links to edit and delete each pet" do

    visit "/pets"

    expect(page).to have_link('Edit')
    expect(page).to have_link('Delete')
  end
end
