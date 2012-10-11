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
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  job_id  (job_id)
#

require 'spec_helper'

describe Card do
  pending "add some examples to (or delete) #{__FILE__}"
end
