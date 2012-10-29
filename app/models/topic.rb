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

class Topic < AbstractAppModel
  attr_accessible :body, :category, :published, :published_at, :title
  acts_as_paranoid

  module Category
    IMPORTANT    = 1 # 重要なお知らせ。補填が必要なエラー等
    MAINTENANCE  = 2 # メンテナンス告知
    ANNOUNCEMENT = 3 # 1,2,4 のいずれでもないお知らせ
    EVENT        = 4 # イベント告知
    INFORMATION  = [IMPORTANT, MAINTENANCE, ANNOUNCEMENT] # 運営情報欄に表示
  end
  include Category

  scope :published, ->{
    where(published: true)
    .where("published_at <= :now", now: Time.current)
    .order("published_at DESC")
  }

  scope :important,    ->{ published.where(category: IMPORTANT) }
  scope :maintenance,  ->{ published.where(category: MAINTENANCE) }
  scope :announcement, ->{ published.where(category: ANNOUNCEMENT) }
  scope :event,        ->{ published.where(category: EVENT) }
  scope :information,  ->{ published.where(category: INFORMATION)}
end

