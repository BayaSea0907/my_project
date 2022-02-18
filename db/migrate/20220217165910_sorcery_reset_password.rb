class SorceryResetPassword < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_password_token, :string, default: nil, comment: 'パスワードリセットトークン'
    add_column :users, :reset_password_token_expires_at, :datetime, default: nil, comment: 'パスワードリセットトークン有効期限'
    add_column :users, :reset_password_email_sent_at, :datetime, default: nil, comment: 'パスワードリセットメール送信日時'
    add_column :users, :access_count_to_reset_password_page, :integer, default: 0, comment: 'パスワードリセットページアクセス数'

    add_index :users, :reset_password_token
  end
end
