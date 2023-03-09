class Artist < ApplicationRecord
  has_many :lineups
  has_many :events, through: :lineups
  acts_as_favoritable
end
