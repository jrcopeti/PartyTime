class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  has_many :rsvps, dependent: :destroy
  has_many :lineups, dependent: :destroy
  has_many :artists, through: :lineups, dependent: :destroy
  has_one_attached :photo
  acts_as_favoritable

  scope :happening_now, -> { where("start_date <= ? AND end_date >= ?", Time.now, Time.now) }
  scope :events_by_date, -> { where("end_date >= ?", Time.now).order("start_date ASC").group_by(&:start_date) }
  scope :popular_events, -> { where("end_date >= ?", Time.now).sort_by { |event| -event.total_rsvps }.first(6) }

  validates :start_date, :end_date, presence: true
  validates :title, presence: true, uniqueness: true
  CATEGORIES = %w[Party Concert Gathering Techno Jazz Pop House Eletronica Alternative]
  validates :category, inclusion: { in: CATEGORIES }

  validate :start_date_must_be_after_now

  validate :end_date_is_after_start_date


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

  def total_rsvps
    rsvps.count
  end

  private

  def add_default_cover
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.jpg")), filename: 'default.jpg' , content_type: "image/jpg")
    end
  end

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end


  def start_date_must_be_after_now
    if start_date.present? && start_date <= Time.now
      errors.add(:start_date, "must be after current time")
    end
  end
end
