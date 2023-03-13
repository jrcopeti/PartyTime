class Venue < ApplicationRecord
  has_many :events, dependent: :destroy
  acts_as_favoritable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
