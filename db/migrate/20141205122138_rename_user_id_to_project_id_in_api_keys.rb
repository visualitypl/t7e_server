class RenameUserIdToProjectIdInApiKeys < ActiveRecord::Migration
  def change
    rename_column :api_keys, :user_id, :project_id
  end
end
