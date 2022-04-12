class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false, limit: 255, index: { unique: true }, comment: 'タイトル'
      t.text :content, null: false, comment: '本文'
    end
  end
end
