class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_bookings
  # has_many :attendees, through: :event_attendees, source: :user

  scope :past, -> { where(date: ..Date.today) }
  scope :future, -> { where(date: Date.today..) }
end
