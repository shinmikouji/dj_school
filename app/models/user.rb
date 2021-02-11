class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REBEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 },
                      format: { with: VALID_EMAIL_REBEX },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }
end
