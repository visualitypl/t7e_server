class ProjectUser < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  enum user_type: [:translator, :developer, :project_owner, :admin]

end