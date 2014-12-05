class TranslationEntry < ActiveRecord::Base
  belongs_to :parent_entry
  belongs_to :project
end
