# frozen_string_literal: true

class User < ApplicationRecord
  acts_as_token_authenticatable

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, :username, uniqueness: true, presence: true

  before_create :assign_role

  def lunch_admin?
    has_role?(:lunch_admin)
  end

  private

  def assign_role
    add_role(:lunch_admin) unless User.exists?
  end
end
