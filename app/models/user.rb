# frozen_string_literal: true

class User < ApplicationRecord
  NAME_LENGTH = (2..30).freeze

  acts_as_token_authenticatable

  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :username, uniqueness: true, presence: true
  validates :username, length: { in: NAME_LENGTH }

  before_create :assign_role

  def lunch_admin?
    has_role?(:lunch_admin)
  end

  def app_admin?
    has_role?(:app_admin)
  end

  private

  def assign_role
    add_role(:lunch_admin) unless User.exists?
  end
end
