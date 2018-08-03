# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    lunch_admin?
  end

  def show?
    lunch_admin? || same_user?
  end

  def update?
    same_user?
  end

  def same_user?
    user.equal?(record)
  end
end
