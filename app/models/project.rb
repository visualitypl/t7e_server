class Project < ActiveRecord::Base
  has_many :api_keys

  def session_api_key
    api_keys.active.first_or_create
  end
end
