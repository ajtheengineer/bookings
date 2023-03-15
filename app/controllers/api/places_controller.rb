module Api
  class PlacesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      filtered_places = Place.all
      if !params[:search_term].blank?
        filtered_places = Place.where("name LIKE :search_term OR description LIKE :search_term", search_term: "%#{params[:search_term]}%")
      end
      # This is return a list of places and all the fields for each place.
      places_json = filtered_places.includes(:reviews).map do |place|
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

      sorted_places_json = if params["sort_option"] == "rating_asc"
        places_json.sort_by { |obj| obj[:average_rating] }
      else
        places_json.sort_by { |obj| obj[:average_rating] }.reverse
      end

      render json: {
        places: sorted_places_json
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