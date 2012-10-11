# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  job_id     :integer
#  strength   :integer
#  dexterity  :integer
#  magic      :integer
#  agility    :integer
#  vitality   :integer
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  job_id  (job_id)
#

class Card < AbstractAppModel
  belongs_to :job
  attr_accessible :agility, :dexterity, :magic, :name, :strength, :vitality
  acts_as_paranoid
end
