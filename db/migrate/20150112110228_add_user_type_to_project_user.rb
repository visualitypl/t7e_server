class AddUserTypeToProjectUser < ActiveRecord::Migration
  def change
    add_column :project_users, :user_type, :integer
    add_index :project_users, :user_type
  end
end
