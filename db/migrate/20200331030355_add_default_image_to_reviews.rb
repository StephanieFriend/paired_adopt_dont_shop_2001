# frozen_string_literal: true

class AddDefaultImageToReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :image, :string, default: 'https://www.eaglenewsonline.com/wp-content/uploads/2018/12/paws-tongue.jpg'
  end
end
