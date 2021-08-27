class PostImage < ApplicationRecord
  belongs_to :spot
  attachment :image
end
