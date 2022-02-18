class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }, comment: 'メールアドレス'
      t.string :crypted_password, comment: '暗号化済パスワード'
      t.string :salt, comment: 'パスワードハッシュ'

      t.timestamps null: false
    end
  end
end
