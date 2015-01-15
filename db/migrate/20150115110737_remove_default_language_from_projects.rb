class RemoveDefaultLanguageFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :default_language, :string
  end
end
