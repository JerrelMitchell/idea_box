class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :ideas, dependent: :destroy
  has_many :categories, dependent: :destroy

  has_secure_password

  enum role: [:default, :admin]
end
