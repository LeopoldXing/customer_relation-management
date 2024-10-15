# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[6.1]
  def up
    change_table :admin_users do |t|
      # t.string :email,              null: false, default: "" # Commented out because the column already exists
      t.string :encrypted_password, null: false, default: ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      # Uncomment the following lines if Trackable is enabled in Devise
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      # If you don't want to track timestamps, remove the following line.
      t.timestamps null: false
    end

    # add_index :admin_users, :email,                unique: true # The index on the email column already exists
    add_index :admin_users, :reset_password_token, unique: true
  end

  def down
    # By default, don't remove the email column as it might be needed elsewhere
    change_table :admin_users do |t|
      # t.remove :email # Don't remove email
      t.remove :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
    end
  end
end
