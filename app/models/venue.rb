class Venue < ApplicationRecord
  has_many :events, dependent: :destroy
  acts_as_favoritable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.venues_with_event_happening_now
    Venue.joins(:events).where('events.start_date <= ? AND events.end_date >= ?', Time.now, Time.now)
  end
end
