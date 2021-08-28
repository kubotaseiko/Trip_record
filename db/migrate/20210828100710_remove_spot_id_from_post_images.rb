class RemoveSpotIdFromPostImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_images, :spot_id, :integer
  end
end
