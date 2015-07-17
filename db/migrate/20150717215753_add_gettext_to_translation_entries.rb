class AddGettextToTranslationEntries < ActiveRecord::Migration
  def change
    add_column :translation_entries, :gettext, :boolean
  end
end
