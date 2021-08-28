class Spot < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
  belongs_to :trip, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
  validates :latitude, presence: true
  validates :longitude, presence: true
  
  # =============GoogleMapに使用=============
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
