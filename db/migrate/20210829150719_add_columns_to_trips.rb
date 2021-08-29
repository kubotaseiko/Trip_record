class AddColumnsToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :starts_at, :datetime
    add_column :trips, :ends_at, :datetime
  end
end
