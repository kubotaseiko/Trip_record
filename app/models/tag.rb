class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy, foreign_key: 'tag_id'
  has_many :spots, through: :tagmaps, dependent: :destroy
  
  # ==============tag一覧表示================
  def tag_filter(user)
    tag_list = Tagmap.tags.where(user_id: user.id)
    tag_list.uniq!
    return tag_list
  end
end
