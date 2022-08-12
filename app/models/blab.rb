class Blab < ApplicationRecord
  belongs_to :user

  validates :body, :user_id, presence: true
  validates :body, length: { maximum: 250 }

  def self.all_blabs_for_feed(user)
    Blab.where(user: user.followees).or(user.blabs).order(created_at: :desc)
  end
end
