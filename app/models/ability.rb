class Ability
  include CanCan::Ability

  def initialize(user)
   
    user ||= User.new # guest user (not logged in)
    if user.role >= Role::ADMIN
      can :manage, :all
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
    end

    if user.role >= Role::MANAGER
      can :read, :all
    end

    if user.role >= Role::EMPLOYEE
    end

    if user.role >= Role::USER
    end

    if user.role >= Role::GUEST
    end

  end
end
