class Rsvp < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :past, -> { joins(:event).where('events.start_date < ?', Date.today)}
  scope :future, -> { joins(:event).where('events.start_date >= ?', Date.today) }

end
