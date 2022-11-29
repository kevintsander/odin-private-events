class AddEventAttendeesForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key 'event_attendees', 'events'
    add_foreign_key 'event_attendees', 'users'
  end
end
