class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :girlfriends, foreign_key: 'pimp_id'
  has_many :appointments, foreign_key: 'client_id'


   def self.find_for_facebook_oauth(auth)
    user = User.find_by_email(auth.info.email)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create unless user

    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]  # Fake password for validation
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.picture = auth.info.image
    user.token = auth.credentials.token
    user.token_expiry = Time.at(auth.credentials.expires_at)
    user.save

    user
  end
end
