class Project < ActiveRecord::Base
  has_many :api_keys

  has_many :translation_entries

  def session_api_key
    api_keys.active.first_or_create
  end
end
