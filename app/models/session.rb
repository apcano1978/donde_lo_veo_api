# == Schema Information
#
# Table name: sessions
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  token      :string
#  valid_to   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Session < ApplicationRecord
  belongs_to :user

  validates :token, presence: true
end
