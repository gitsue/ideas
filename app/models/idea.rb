class Idea < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  def self.top
  	order('likes_count DESC')
  end
end
