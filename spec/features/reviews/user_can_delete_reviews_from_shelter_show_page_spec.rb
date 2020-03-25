require 'rails_helper'

describe "reviews delete process" do
  it "I see a link on shelters show page that can to delete review" do

      visit("/shelters/#{@shelter_2.id}")

      click_link 'Delete Review'

      expect(current_path).to eq("/shelters/#{@shelter_2.id}")

      expect(page).not_to have_content("These guys were ok....ish")
  end
end
