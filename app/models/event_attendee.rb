class EventAttendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :invited_users, -> { includes(:user).where(status: 'Invited') }
  scope :attending_users, -> { includes(:user).where(status: 'Attending') }
end
