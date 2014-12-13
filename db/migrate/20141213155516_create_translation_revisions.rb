class CreateTranslationRevisions < ActiveRecord::Migration
  def change
    create_table :translation_revisions do |t|
      t.references :translation, index: true
      t.references :user, index: true
      t.text :value

      t.timestamps null: false
    end
    add_foreign_key :translation_revisions, :translations
    add_foreign_key :translation_revisions, :users
  end
end
