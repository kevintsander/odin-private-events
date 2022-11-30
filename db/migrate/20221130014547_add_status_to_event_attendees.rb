class AddStatusToEventAttendees < ActiveRecord::Migration[7.0]
  def up
    add_column :event_attendees, :status, :string
    execute "UPDATE event_attendees SET status = 'Attending'"
  end

  def down
    remove_column :event_attendees, :status
  end
end
