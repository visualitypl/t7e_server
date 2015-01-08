class Ability
  include CanCan::Ability

  def initialize(user)
    return false if user.nil?

    if user.user_type.translator?

    end

    if user.user_type.developer?

    end

    if user.user_type.project_owner?

    end

    if user.user_type.admin?
      can :manage, :all
    end

  end
end
