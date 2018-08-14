# frozen_string_literal: true

class OrderPolicy < ApplicationPolicy
  def show?
    lunch_admin? || order_owner?
  end

  private

  def order_owner?
    user == record.user
  end

  alias_method :index?,  :lunch_admin?
  alias_method :create?, :trust

  public :index?, :create?
end
