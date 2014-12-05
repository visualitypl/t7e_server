class RenameTypeToKeyTypeInTranslationEntries < ActiveRecord::Migration
  def change
    rename_column :translation_entries, :type, :key_type
  end
end
