# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!
  respond_to :html
end
