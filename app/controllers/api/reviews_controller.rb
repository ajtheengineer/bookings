module Api
  class ReviewsController < ApplicationController
    def index
      place = Place.find(params[:place_id])

      reviews_json = place.reviews.map do |review|
        {
          id: review.id,
          display_name: review.display_name,
          comment: review.comment,
          rating: review.rating,
          created_at: review.created_at,
          updated_at: review.updated_at 
        }
      end

      render json: {
        reviews: reviews_json
      }
    end
  end
end