class Review < ApplicationRecord
  belongs_to :user
  belongs_to :menu
  validates  :content, presence: true, length: { maximum: 300 }
  default_scope -> { order(created_at: :desc) }
end