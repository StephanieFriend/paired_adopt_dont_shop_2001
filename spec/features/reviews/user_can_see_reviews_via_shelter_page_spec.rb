require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can see shelter reviews via the shelter show page' do
    review_1 = @shelter_1.reviews.create({ title: "This is Awesome",
                  rating: "9",
                  content: "This is some content about the shelter",
                  image: 'https://i.imgur.com/wKls5bM.png'})
    review_2 = @shelter_1.reviews.create({ title: "This is Great",
                                           rating: "8",
                                           content: "This is some content about the shelter",
                                           image: 'https://i.imgur.com/wKls5bM.png'})

    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.content)
    expect(page).to have_content(review_2.content)
    save_and_open_page
  end
end