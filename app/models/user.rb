# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  container_user_id :string(255)      not null
#  nickname          :string(255)      not null
#  deleted_at        :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  container_user_id  (container_user_id) UNIQUE
#

class User < AbstractAppModel
  attr_accessible :container_user_id, :nickname
  acts_as_paranoid
end
