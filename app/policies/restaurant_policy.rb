class RestaurantPolicy < ApplicationPolicy

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    true
    # return user == record.user
  end

  def destroy?
    return user.admin
  end

  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end
end
