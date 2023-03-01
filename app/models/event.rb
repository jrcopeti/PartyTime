class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :user

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
