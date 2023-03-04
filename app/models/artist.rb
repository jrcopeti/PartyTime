class Artist < ApplicationRecord
  has_many :events, through: :lineups
end
