class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  # validates_presence_of :is_admin, require: false

  has_many :ideas

  has_secure_password
end
