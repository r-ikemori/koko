class PostContent < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_one_attached :image
end
