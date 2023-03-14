class Artist < ApplicationRecord
  has_many :lineups, dependent: :destroy
  has_many :events, through: :lineups, dependent: :destroy
  acts_as_favoritable
end
