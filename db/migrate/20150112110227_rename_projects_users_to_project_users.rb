class RenameProjectsUsersToProjectUsers < ActiveRecord::Migration
  def change
    rename_table :projects_users, :project_users
  end
end
