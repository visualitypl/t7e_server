class Translation < ActiveRecord::Base
  belongs_to :translation_entry
  belongs_to :language
end
