class ChangeTypePathInTranslationEntries < ActiveRecord::Migration
  def change
    remove_index :translation_entries, :path
    change_column :translation_entries, :path, :text
  end
end
