# frozen_string_literal: true

class ItemPolicy < ApplicationPolicy
  alias_method :index?,  :app_admin?
  alias_method :update?, :app_admin?
  alias_method :create?, :app_admin?
  alias_method :show?,   :app_admin?

  public :index?,  :create?,
         :update?, :show?
end
