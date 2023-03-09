class Lineup < ApplicationRecord
  belongs_to :event
  belongs_to :artist

  scope :upcoming, -> { joins(:event).where('events.start_date >= ?', Date.today) }

end
