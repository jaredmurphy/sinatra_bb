# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string   "email", null: false
      t.string   "name",  null: false
      t.string   "login_token"
      t.datetime "login_token_valid_until"

      t.timestamps
    end

    add_index :users, :email,       unique: true
    add_index :users, :login_token, unique: true
  end
end
