# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    user.has_role?(:lunch_admin)
  end

  def show?
    user.has_role?(:lunch_admin) || user.equal?(record)
  end

  def update?
    user.equal?(record)
  end
end
