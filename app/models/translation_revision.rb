class TranslationRevision < ActiveRecord::Base
  belongs_to :translation
  belongs_to :user
end
