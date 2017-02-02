class RemovePasswordAndUsernameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_digest
    remove_column :users, :username
  end

  def down
    add_column :users, :password_digest, :string
    add_column :users, :username, :string

    User.update_all("password_digest = '', username = email")

    change_column_null :users, :password_digest, false
    change_column_null :users, :username, false
  end
end
