class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email,                           null: false
      t.string   :crypted_password,                null: false
      t.string   :salt,                            null: false
      t.string   :name

      t.string   :remember_me_token,               default: nil
      t.datetime :remember_me_token_expires_at,    default: nil

      t.string   :reset_password_token,            default: nil
      t.datetime :reset_password_token_expires_at, default: nil
      t.datetime :reset_password_email_sent_at,    default: nil

      t.index    :email,                unique: true
      t.index    :remember_me_token
      t.index    :reset_password_token

      t.timestamps
    end
  end
end
