# frozen_string_literal: true

class MenuPolicy < ApplicationPolicy
  def create?
    workday? && lunch_admin?
  end

  private

  def workday?
    Date.today.on_weekday?
  end

  alias_method :index?,  :trust
  alias_method :show?,   :trust
  alias_method :new?,    :lunch_admin?
  alias_method :update?, :lunch_admin?

  public :index?, :update?,
         :show?,  :new?
end
