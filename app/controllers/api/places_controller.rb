module Api
  class PlacesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      # This is return a list of places and all the fields for each place.
      places_json = Place.all.includes(:reviews).map do |place|
        {
          id: place.id,
          name: place.name,
          city: place.city,
          description: place.description,
          image_src: place.image_src,
          created_at: place.created_at,
          updated_at: place.updated_at,
          average_rating: place.average_rating
        }
      end

      render json: {
        places: places_json
      }
    end

    def show
      place_id = params[:place_id]

      place = Place.find(place_id)
      render json: {
        place: {
          id: place.id,
          name: place.name,
          city: place.city,
          description: place.description,
          image_src: place.image_src,
          created_at: place.created_at,
          updated_at: place.updated_at
        }
      }
    end
  end
end