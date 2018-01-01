class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :identities

  has_many :proposals

  has_many :votes
  has_many :interests, through: :votes, source: :proposal

  has_many :holdings
  has_many :meetups, through: :holdings, as: :keynotes

  has_many :assistances
  has_many :meetups, through: :assistances

  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage/

  attr_accessor :login

  def self.create_with_omniauth(auth)
    email = auth[:info][:email] || 'change@me.please'
    name = auth[:info][:nickname]
    create(email: email, username: name, password: Devise.friendly_token[0,20])
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
