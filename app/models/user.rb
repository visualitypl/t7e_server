class User < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  classy_enum_attr :user_type

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :projects

end
