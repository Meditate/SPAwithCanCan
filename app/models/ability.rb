class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :index, to: :readindex
    alias_action :show, to: :readshow
    user ||= User.new

    if user.is? :admin
      can :manage, User
      cannot :destroy, User, email: 'admin@example.com'
      cannot :update, User, email: 'admin@example.com'
    end

    if user.is? :user
      can :readindex, User
      can :readshow, User, id: user.id
    end
  end
end
