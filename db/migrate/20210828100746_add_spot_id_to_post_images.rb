class AddSpotIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_images, :spot, index: true
  end
end
