# == Schema Information
#
# Table name: articles
#
#  id      :integer          not null, primary key
#  content :text             not null
#  title   :string(255)      not null
#
# Indexes
#
#  index_articles_on_title  (title) UNIQUE
#
class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { minimum: 50 }
end
