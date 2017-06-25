# frozen_string_literal: true

class AddOauthFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider,         :text
    add_column :users, :uid,              :text
    add_column :users, :first_name,       :text
    add_column :users, :last_name,        :text
    add_column :users, :token,            :text
    add_column :users, :refresh_token,    :text
    add_column :users, :oauth_expires_at, :datetime
  end
end
