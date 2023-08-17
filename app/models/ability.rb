# frozen_string_literal: true

# Ability class for authorization
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    return unless user.id

    can :manage, Group, user_id: user.id
    can :manage, Expense, author_id: user.id
  end
end
