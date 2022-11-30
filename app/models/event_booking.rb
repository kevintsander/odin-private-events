class EventBooking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :invited_users, -> { includes(:user).where(status: 'Invited') }
  scope :attending_users, -> { includes(:user).where(status: 'Attending') }

  def allowed_status?(new_status, user)
    allowed = false
    puts "STATUS - #{new_status}"
    case new_status
    when 'Invited'
      allowed = true
    when 'Attending'
      allowed = true if !event.invite_only || (event.invite_only && (event.creator == user || status == 'Invited'))
    end
    allowed
  end
end
