require 'rails_helper'

RSpec.describe Shelter, type: :model do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe "relationships" do
    it { should have_many :pets }
    it { should have_many :reviews }
  end

  describe "instance methods" do
    it "can return pet count for individual shelter" do
      
      expect(@shelter_1.pet_count).to eq(2)
      expect(@shelter_2.pet_count).to eq(2)
    end

    it "can return review count for individual shelter" do

      expect(@shelter_1.review_count).to eq(2)
      expect(@shelter_2.review_count).to eq(1)
    end

    it "can return review average for individual shelter" do

      expect(@shelter_1.review_average).to eq(3.5)
    end

    it "can return application count for individual shelter" do

      expect(@shelter_2.open_apps).to eq(0)
    end
  end
end
