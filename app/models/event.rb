class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_bookings

  scope :past, -> { where(date: ..Date.today) }
  scope :future, -> { where(date: Date.today..) }

  def user_can_attend?(user)
    user_booking = event_bookings.find_by(user_id: user.id)
    return false if user_booking&.status == 'Attending' # already attending

    return true unless invite_only

    return true if user_booking&.status == 'Invited'
    return true if user == creator

    false
  end
end
