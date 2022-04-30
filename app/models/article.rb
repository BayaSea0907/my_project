# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_articles_on_title  (title) UNIQUE
#
class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { minimum: 50 }

  scope :search, ->(query) do
    sanitized_query = "%#{sanitize_sql_like(query)}%"
    where('title LIKE :title OR content LIKE :content',
          { title: sanitized_query, content: sanitized_query })
  end
end
