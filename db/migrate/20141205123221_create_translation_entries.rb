class CreateTranslationEntries < ActiveRecord::Migration
  def change
    create_table :translation_entries do |t|
      t.string :key
      t.integer :type
      t.references :parent_entry, index: true
      t.string :path
      t.references :project, index: true

      t.timestamps null: false
    end
    add_index :translation_entries, :key
    add_index :translation_entries, :type
    add_index :translation_entries, :path
    # add_foreign_key :translation_entries, :parent_entries
    # add_foreign_key :translation_entries, :projects
  end
end
