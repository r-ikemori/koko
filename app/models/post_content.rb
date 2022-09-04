class PostContent < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_one_attached :image
  has_many_attached :main_images
  has_many :comments
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  
  def favorited?(customer)
   favorites.where(customer_id: customer.id).exists?
  end
  
  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
