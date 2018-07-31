# frozen_string_literal: true

EMAIL_LENGTH_RANGE = 6..40

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, length: { in: EMAIL_LENGTH_RANGE }
  validates :email, uniqueness: true
end
