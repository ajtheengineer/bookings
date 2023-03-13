module Api
  class ReviewsController < ApplicationController
    skip_before_action :verify_authenticity_token

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

    def create
      place = Place.find(params[:place_id])
      Review.create!(
        place_id: place.id,
        comment: params[:comment],
        rating: params[:rating].to_i,
        display_name: params[:display_name]
      )

      render json: {}, status: :created
    end
  end
end