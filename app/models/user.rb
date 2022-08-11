class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :display_name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :handle, presence: true, length: { minimum: 2, maximum: 40 }, uniqueness: true
  validates :bio, length: { maximum: 200 }

  has_many :blabs, dependent: :destroy

  def to_param
    handle
  end
end
