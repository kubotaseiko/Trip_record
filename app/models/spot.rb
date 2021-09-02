class Spot < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
  accepts_attachments_for :post_images, attachment: :image, append: :true
  belongs_to :trip
  belongs_to :user

  # =============GoogleMapに使用=============
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  # =============bookmark=============
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  # =============tag関連=============
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_spot_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_spot_tag
    end
  end

end
