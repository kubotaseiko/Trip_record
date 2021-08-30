class Trip < ApplicationRecord
  has_many :spots, dependent: :destroy
  belongs_to :user

# =============バリデーション=============
  validates :starts_at, presence: true
  validates :ends_at, presence: true

end
