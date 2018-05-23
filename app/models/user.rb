class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :ideas
  has_many :categories

  has_secure_password

  enum role: [:default, :admin]
end
