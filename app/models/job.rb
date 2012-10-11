# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Job < AbstractAppModel
  has_many :cards
  attr_accessible :name
  acts_as_paranoid
end
