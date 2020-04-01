class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates_presence_of :name,
                        :address,
                        :city,
                        :state,
                        :zip

  def pet_count
   pets.count
  end

  def review_count
    reviews.count
  end

  def review_average
    review_ratings.reduce(:+) / review_ratings.size.to_f
  end

  def open_apps
    pets.joins(:applications).count
  end

  private

  def review_ratings
    reviews.map { |review| review.rating.to_i }
  end
end

#on shelter's index page ratings show up
  #logic on model to sort and display top three that I call on the index views page
