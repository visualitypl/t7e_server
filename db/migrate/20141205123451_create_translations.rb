class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.references :translation_entry, index: true
      t.text :value
      t.references :language, index: true

      t.timestamps null: false
    end
    add_foreign_key :translations, :translation_entries
    add_foreign_key :translations, :languages
  end
end
