class ChangeUsersTableAddTwitterInfo < ActiveRecord::Migration
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :password, :string
    remove_column :users, :email, :string

    add_column :users, :nickname, :string
    add_column :users, :name, :string
  end
end
