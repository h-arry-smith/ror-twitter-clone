class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :display_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :handle, presence: true, length: { minimum: 2, maximum: 40 }, uniqueness: true
  validates :bio, length: { maximum: 200 }

  has_many :blabs, dependent: :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"
  has_many :followees, through: :followed_users, source: :followed

  has_many :following_users, foreign_key: :followed_id, class_name: "Following"
  has_many :followers, through: :following_users

  def to_param
    handle
  end
end
