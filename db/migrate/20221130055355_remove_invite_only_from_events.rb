class RemoveInviteOnlyFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :invite_only?, :boolean
  end
end
