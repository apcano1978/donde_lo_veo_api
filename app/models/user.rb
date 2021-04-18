# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  name            :string
#  lastname        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :sessions
end
