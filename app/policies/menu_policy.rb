# frozen_string_literal: true

class MenuPolicy < ApplicationPolicy
  alias_method :index?,  :trust
  alias_method :show?,   :trust
  alias_method :new?,    :lunch_admin?
  alias_method :update?, :lunch_admin?
  alias_method :create?, :lunch_admin?

  public :index?, :create?, :update?,
         :show?,  :new?
end
