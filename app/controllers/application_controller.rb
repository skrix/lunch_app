# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  respond_to :html
end
