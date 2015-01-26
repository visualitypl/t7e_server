class Ability
  include CanCan::Ability

  def initialize(user)
    return false if user.nil?

    # TODO: fix it
    # if user.user_type.admin?
    if user.id == 1
      can :manage, :all
    else
      user.project_users do |project_user|
        project = project_user.project
        user_type = project_user.user_type
      end
    end



    # if user.user_type.translator?
    #
    # end
    #
    # if user.user_type.developer?
    #
    # end
    #
    # if user.user_type.project_owner?
    #
    # end
    #
    # if user.user_type.admin?
    #   can :manage, :all
    # end

  end
end
