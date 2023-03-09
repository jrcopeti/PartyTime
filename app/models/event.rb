class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  has_many :rsvps, dependent: :destroy
  has_many :lineups
  has_many :artists, through: :lineups
  acts_as_favoritable
  # accepts_nested_attributes_for :lineups

  # validate :end_date_after_start_date

  # def end_date_after_start_date
  #   if end_date.present? && start_date.present? && end_date < start_date
  #     errors.add(:end_date, "must be after the start date")
  #   end
  # end

  include PgSearch::Model

  pg_search_scope :global_search,
    against: %i[ title category start_date  ],
    associated_against: {
      venue: %i[ name address ]
    },
    using: {
      tsearch: { prefix: true }
    }


end
