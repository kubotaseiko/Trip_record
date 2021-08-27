class AddTripIdToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :trip_id, :integer
  end
end
