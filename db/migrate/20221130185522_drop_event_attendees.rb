class DropEventAttendees < ActiveRecord::Migration[7.0]
  def change
    drop_table :event_attendees, id: false, force: :cascade do |t|
      t.bigint 'event_id', null: false
      t.bigint 'user_id', null: false
      t.string 'status'
      t.index %w[user_id event_id], name: 'index_event_attendees_on_user_id_and_event_id'
    end
  end
end
