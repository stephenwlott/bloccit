class PostPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope
    def initializer(user, scope)
      @user = user
      @scope = scope
    end
    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.member?
        scope.where(:user_id => user.id)
      else
        scope.none
      end
    end
  end
  
  def index?
    true
  end
end
