class List < ApplicationRecord
    belongs_to :user

  def get_site_info(url)
    meta = MetaInspector.new(url)
    self.image = meta.images.best
  end

  # =============GoogleMapに使用=============
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  
  # =============バリデーション=============
  validates :spot_name, presence: true
  validates :address, presence: true
  validates :site_url, presence: true

end
