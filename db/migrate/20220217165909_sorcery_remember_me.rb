class SorceryRememberMe < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remember_me_token, :string, default: nil, comment: 'リメンバーミートークン'
    add_column :users, :remember_me_token_expires_at, :datetime, default: nil, comment: 'リメンバーミートークン有効期限'

    add_index :users, :remember_me_token
  end
end
