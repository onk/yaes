# -*- coding: utf-8 -*-
# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  category     :integer          not null
#  title        :string(255)      not null
#  body         :text             default(""), not null
#  published_at :datetime         not null
#  published    :boolean          default(FALSE), not null
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  published_at  (published_at)
#

require 'spec_helper'

describe Topic do
  describe ".published" do
    before {
      @not_published = FactoryGirl.create(:topic, published: false)
      @yet_published = FactoryGirl.create(:topic, published: true, published_at: 1.hour.since)
      @published     = FactoryGirl.create(:topic, published: true, published_at: 1.hour.ago)
    }
    subject { Topic.published }
    it { should_not include(@not_published) }
    it { should_not include(@yet_published) }
    it { should include(@published) }
  end
end

