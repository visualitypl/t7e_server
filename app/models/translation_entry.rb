class TranslationEntry < ActiveRecord::Base
  enum key_type: [ :key, :block ]

  belongs_to :parent_entry, class_name: TranslationEntry
  belongs_to :project

  has_many :translations, dependent: :destroy

end
