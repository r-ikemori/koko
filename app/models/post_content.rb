class PostContent < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_one_attached :image
  has_many_attached :main_images
  has_many :comments, dependent: :destroy
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  validates :main_images, presence: true

  def favorited?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
