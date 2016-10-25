class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea
  validates :name, :alias, presence: true, length: {minimum: 3}
  validates :password, length: {minimum: 8}, on: :create, :confirmation => true
  validates_confirmation_of :password, :allow_blank => true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
