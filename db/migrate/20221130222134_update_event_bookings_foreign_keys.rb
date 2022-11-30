class UpdateEventBookingsForeignKeys < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key 'event_bookings', 'events'
    remove_foreign_key 'event_bookings', 'users'
    add_foreign_key 'event_bookings', 'events', on_delete: :cascade
    add_foreign_key 'event_bookings', 'users', on_delete: :cascade
  end
end
