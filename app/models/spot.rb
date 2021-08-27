class Spot < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
  belongs_to :trip, dependent: :destroy
  belongs_to :user, dependent: :destroy
end
