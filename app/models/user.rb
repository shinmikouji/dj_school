class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :menus
  has_many :reviews,  dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 30 }
  VALID_EMAIL_REBEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 200 },
                      format: { with: VALID_EMAIL_REBEX },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end