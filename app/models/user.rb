class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REBEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 },
                      format: { with: VALID_EMAIL_REBEX },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 4 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end