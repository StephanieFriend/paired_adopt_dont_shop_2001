require 'rails_helper'

RSpec.describe "pet show page", type: :feature do
  it "can complete deletion with DELETE and redirect" do

    visit "/pets/#{@pet_1.id}"

    click_link 'Delete'

    expect(current_path).to eq('/pets')
    expect(page).not_to have_content(@pet_1.name)
    expect(page).not_to have_content(@pet_1.age)
    expect(page).not_to have_content(@pet_1.sex)
  end
end
