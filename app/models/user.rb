class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :sessions
end
