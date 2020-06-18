# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :shelter

  validates :title,
            :rating,
            :content, presence: true
end
