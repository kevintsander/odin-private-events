class CreateEventAttendeesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :events, :users, table_name: :event_attendees do |t|
      # t.index [:event_id, :user_id]
      t.index %i[user_id event_id]
    end
  end
end
