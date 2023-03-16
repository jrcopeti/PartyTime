class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  has_many :rsvps, dependent: :destroy
  has_many :lineups, dependent: :destroy
  has_many :artists, through: :lineups, dependent: :destroy
  acts_as_favoritable

  scope :happening_now, -> { where("start_date <= ? AND end_date >= ?", Time.now, Time.now) }
  scope :events_by_date, -> { where("end_date >= ?", Time.now).order("start_date ASC").group_by(&:start_date)}
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

  def happening?
    Time.now >= start_date && Time.now <= end_date
  end

  private

  def add_default_cover
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end

end
