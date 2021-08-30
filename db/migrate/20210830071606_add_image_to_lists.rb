class AddImageToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :image, :text
  end
end
