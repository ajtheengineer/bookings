Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bookings#index"

  get "api/places", to: "api/places#index"
  get "api/places/:place_id", to: "api/places#show"
  get "api/places/:place_id/reviews", to: "api/reviews#index"
  post "api/places/:place_id/reviews", to: "api/reviews#create"
  get "*path", to: "bookings#index"
end
