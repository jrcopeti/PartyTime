class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :rsvps, dependent: :destroy
  has_one_attached :photo
  has_many :invitations
  has_many :pensing_invitations, -> {where confirmed: false }, class_name: 'Invitation', foreign_key: "friend_id"
  acts_as_favoritor
  followability
  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  include PgSearch::Model

  pg_search_scope :global_search,
                  against: %i[full_name nickname address email],
                  using: {
                    tsearch: { prefix: true }
                  }

  require "open-uri"

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.nickname = auth.info.name.downcase.delete(' ')
      file = URI.open(auth.info.image)
      user.photo.attach(io: file, filename: user.full_name, content_type: "image/jpg")
    end
  end

  def rsvp(event)
    rsvps.find_by(event_id: event.id)
  end

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
