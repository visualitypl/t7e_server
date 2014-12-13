class CreateProjectLanguages < ActiveRecord::Migration
  def change
    create_table :project_languages do |t|
      t.references :project, index: true
      t.references :language, index: true

      t.timestamps null: false
    end
    add_foreign_key :project_languages, :projects
    add_foreign_key :project_languages, :languages
  end
end
