class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :rsvps, dependent: :destroy
  has_one_attached :photo
  after_validation :geocode, if: :will_save_change_to_address?
  geocoded_by :address


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # for Google OmniAuth
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
    end
  end

  def rsvp(event)
    rsvps.find_by(event_id: event.id)
  end
end
