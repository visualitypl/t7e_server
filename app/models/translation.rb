class Translation < ActiveRecord::Base
  belongs_to :translation_entry
  belongs_to :language

  has_many :translation_revisions

  def create_translation_revision!(user)
    self.translation_revisions.create!(value: value, user: user)
  end
end
