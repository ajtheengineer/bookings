class Place < ApplicationRecord
  has_many :reviews

  def average_rating
    ratings = reviews.map(&:rating)
    1.0 * ratings.sum / ratings.count
  end
end