class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :addresses, through: :user_addresses
  has_many :orders

  TEMP_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:digitalocean]

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
