class TranslationEntry < ActiveRecord::Base
  enum key_type: [ :key, :block ]

  belongs_to :parent_entry, class_name: TranslationEntry
  belongs_to :project

  has_many :translations, dependent: :destroy

  before_save :generate_path

  def self.gettext
    where(gettext: true)
  end

  private
  def generate_path
    if parent_entry
      prefix_path = "#{parent_entry.path}."
    else
      prefix_path = ""
    end
    self.path = "#{prefix_path}#{key}"
  end

end
