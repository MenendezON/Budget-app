# app/models/ability.rb
class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, Post
    else
      can :read, Post
    end
  end
end
