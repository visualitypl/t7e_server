class Project < ActiveRecord::Base
  after_create :session_api_key

  belongs_to :default_language, class_name: Language
  has_many :api_keys

  has_many :project_languages
  has_many :translation_entries

  has_many :project_users
  has_many :users, through: :project_users

  def session_api_key
    api_keys.active.first_or_create
  end
end
