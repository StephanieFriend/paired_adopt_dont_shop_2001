require 'rails_helper'


RSpec.describe "After I've favorited a pet" do
  it "When I visit that pet's show page I don't see favorite link but one to remove it from favorites" do

    visit "/pets/#{@pet_1.id}"

    click_on('Favorite This Pet')

    expect(page).not_to have_link('Favorite This Pet')
    expect(page).to have_link('Un-favorite This Pet')
  end

  it "it is removed from favorites when I click link (Remove From Favorites)" do

    visit "/pets/#{@pet_1.id}"

    click_on('Favorite This Pet')


    click_on('Un-favorite This Pet')

    expect(current_path).to eq("/pets/#{@pet_1.id}")
    expect(page).to have_content("#{  @pet_1.name} has been removed from your favorites")
    expect(page).to have_link('Favorite This Pet')
    expect(page).not_to have_link('Un-favorite This Pet')
 end
end
