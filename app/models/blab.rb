class Blab < ApplicationRecord
  belongs_to :user

  validates :body, :user_id, presence: true
  validates :body, length: { maximum: 250 }
end
