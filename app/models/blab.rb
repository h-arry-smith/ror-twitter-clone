class Blab < ApplicationRecord
  paginates_per 5

  belongs_to :user

  has_one :parent, class_name: "Blab", primary_key: :parent_id, foreign_key: :id
  has_many :replies, foreign_key: :parent_id, class_name: "Blab"

  validates :body, :user_id, presence: true
  validates :body, length: { maximum: 250 }

  def self.all_blabs_for_feed(user)
    Blab.where(user: user.followees).or(user.blabs).order(created_at: :desc)
  end
end
