class AddIndexToReservations < ActiveRecord::Migration[6.1]
  def change
    add_index :reservations, :user_id
  end
end
