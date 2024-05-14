# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # utente ospite (non loggato)

    if user.admin?
      can :manage, :all
    elsif user.teacher?
      can :read, :all
      can :manage, Project, user_id: user.id
      can :manage, Snippet, user_id: user.id
    else
      can :read, :all
      can :manage, Snippet, user_id: user.id
    end
  end
end
