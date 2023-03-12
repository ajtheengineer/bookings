module Api
  class PlacesController < ApplicationController
    def index
      # This is return a list of places and all the fields for each place.
      places_json = Place.all.map do |place|
        {
          id: place.id,
          name: place.name,
          city: place.city,
          description: place.description,
          image_src: place.image_src,
          created_at: place.created_at,
          updated_at: place.updated_at
        }
      end

      render json: {
        places: places_json
      }
    end
  end
end