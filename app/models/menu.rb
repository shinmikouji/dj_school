class Menu < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reservations
  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :price, presence: true
end
