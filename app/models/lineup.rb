class Lineup < ApplicationRecord
  belongs_to :events
  belongs_to :artists
end
