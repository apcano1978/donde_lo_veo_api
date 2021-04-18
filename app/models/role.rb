# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  code       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
