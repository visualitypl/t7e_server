class AddDefaultLanguageToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :default_language, index: true
  end
end
