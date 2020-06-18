# frozen_string_literal: true

module ReviewsHelper
  def review_id
    Review.find(params[:id])
  end

  def review_params
    params.delete(:image) if params[:image].empty?
    params.permit(:title, :rating, :content, :image)
  end
end
