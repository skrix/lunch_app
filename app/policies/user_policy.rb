# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    lunch_admin? || same_user?
  end

  private

  def same_user?
    user.eql?(record)
  end

  alias_method :index?,  :lunch_admin?
  alias_method :update?, :same_user?

  public :update?, :index?
end
